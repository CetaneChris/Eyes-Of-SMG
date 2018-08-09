from skimage.measure import compare_ssim
import argparse
import imutils
import cv2
import numpy as np
import sys
import mysql.connector
import time
import datetime

# Simply parses the Calibration.txt file and returns relevant info
def coordinates(seatList):
	seatNum = []
	x = []
	y = []
	w = []
	h = []

	# Loading arrays with data from Calibration.txt
	for i in seatList:
		nameCoord = i.split(" ")
		# Checks if size is the expected size
		if len(nameCoord) == 2:
			#Splitting the second argument of nameCoord, which are the coordinates
			coord = nameCoord[1].split(",")
			
			# Checks if size is the expected size
			if len(coord) == 4:
				# Seat, x, y, w, h
				seatNum.append(nameCoord[0])
				x.append(coord[0])
				y.append(coord[1])
				w.append(coord[2])
				h.append(coord[3])
				
			else:
				sys.exit("Error with size of coord!{}".format(coord))
			
		else:
			sys.exit("Error with size of nameCoord!{}".format(nameCoord))
			
	return seatNum,x,y,w,h
	
def seatAttend(activeSeats,seatList):
	list = []
	
	for i in seatList:
		if i in activeSeats:
			list.append('PRESENT') #present
			#print("{} is present!".format(i))
		else:
			list.append('EMPTY') #empty
			#print("{} is empty!".format(i))
			
	return list
	
def listToString(list):
	string = ""
	
	if len(list) > 0:
		string = list[0]
	
	for i in range(1,len(list)):
		string = string+","+list[i]
	
	return string
	
def detectFaces(frame):
	face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
	
	faces = face_cascade.detectMultiScale(frame, 1.3, 5) # face detection
	
	if len(faces) > 0:
		return True
	else:
		return False
		
def grabImage(cap):
	imgNotFound = True
	while imgNotFound:
		try:
			cv2.waitKey(10) & 0xff
			ret, frame = cap.read()
			if ret:
				#cv2.imshow("NightOps", frame)
				#height, width, channels = frame.shape
				imgNotFound = False
		
		except AttributeError:
			print("Attribute Error (Frame lost?)")
			
		except KeyboardInterrupt:
			print("Keyboard Interrupt, ending program...")
			sys.exit(0)
		
		except:
			print("Unknown Error Occured...")
	frame = cv2.normalize(frame, None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)
	
	return frame
	
def scanSeats(grayBase,frame,seatNum,min,max,x,y,w,h):
	grayFrame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
	activeSeats = []
	watchingSeats = []
	
	#cv2.imshow("grayBase",grayBase)
	#cv2.imshow("grayFrame",grayFrame)
	
	for i in range(min,max):
		# Selecting individual seats
		subGrayBase = grayBase[int(y[i]):int(y[i])+int(h[i]), int(x[i]):int(x[i])+int(w[i])]
		subGrayFrame = grayFrame[int(y[i]):int(y[i])+int(h[i]), int(x[i]):int(x[i])+int(w[i])]
		
		# Calculating differences
		(score, diff) = compare_ssim(subGrayBase, subGrayFrame, full=True)
		
		#Pixel Difference Score
		if score < .75:
			activeSeats.append(seatNum[i])
			
			if detectFaces(subGrayFrame):
				watchingSeats.append(seatNum[i])
				
	return activeSeats, watchingSeats
				
def highlightSeats(frame,min,max,x,y,w,h,seatNum,activeSeats,watchingSeats):
	unOcc = (0,0,255) # Red
	occupied = (0,255,255) # Yellow
	attention = (0,255,0) # Green

	for i in range(min,max):
		if seatNum[i] in watchingSeats:
			cv2.rectangle(frame, (int(x[i]), int(y[i])), (int(x[i]) + int(w[i]), int(y[i]) + int(h[i])), attention, 2)
		elif seatNum[i] in activeSeats:
			cv2.rectangle(frame, (int(x[i]), int(y[i])), (int(x[i]) + int(w[i]), int(y[i]) + int(h[i])), occupied, 2)
		else:
			cv2.rectangle(frame, (int(x[i]), int(y[i])), (int(x[i]) + int(w[i]), int(y[i]) + int(h[i])), unOcc, 2)
	return frame

def main():
	# Ensures there is one argument fed into program
	ap = argparse.ArgumentParser()
	ap.add_argument("-f", "--first", required=True,
		help="Empty Theater Image")
	ap.add_argument("-s", "--second", required=True,
		help="Camera IP Address")
	ap.add_argument("-t", "--third", required=True,
		help="Theater Number")
	args = vars(ap.parse_args())
	
	activeSeats = []
	watchingSeats = []
	
	#How often the program sends data (in seconds)
	updateTime = 1
	
	theaterNumber = args["third"]
	
	try:
		cnx = mysql.connector.connect(user='SeniorDesign', password='SeniorDesign',
								  host='192.241.135.75',
								  port = '3306',
								  database='seniordesign')
		cursor = cnx.cursor()
	except mysql.connector.Error as err:
		print("A DATABASE ERROR HAS OCCURRED -")
		print(err)
	
	# Opening video source
	cap = cv2.VideoCapture("rtsp://admin:123456@"+args["second"]+"/stream0")
	if not cap.isOpened():
			sys.exit("Couldn't capture video source!")

	# Reads the calibration file and saves each line as a string in a string array
	with open('Calibration.txt') as f:
		seatList = f.readlines()	
	seatList = [x.strip() for x in seatList] #Removes new line character
	
	# Reading base image
	base = cv2.imread(args["first"])
	grayBase = cv2.cvtColor(base, cv2.COLOR_BGR2GRAY)
	
	# Preparing arrays to be filled with seats / coordinates of seats
	seatNum,x,y,w,h = coordinates(seatList)
		
	#Set seat visibility
	showSeats = False
	imgNotFound = True
	clock = 0
	
	# Looping through for each seat
	while True:
		# Read the current frame
		frame = grabImage(cap)
		
		if time.perf_counter() - clock > updateTime:
			clock += updateTime
			
			#
			(activeSeats, watchingSeats) = scanSeats(grayBase,frame,seatNum,0,len(seatList),x,y,w,h)
			
			#
			if showSeats:
				frame = highlightSeats(frame,0,len(seatNum),x,y,w,h,seatNum,activeSeats,watchingSeats)
			
			#Showing image captured
			cv2.imshow("Capture",frame)
			
			# print("Sending seats: {}".format(activeSeats))
			# print("Faces found in seats: {}".format(watchingSeats))
			
			#Displaying active and watching locally
			# reporter = np.zeros((512,1080,3), np.uint8)
			# font = cv2.FONT_HERSHEY_SIMPLEX
			# cv2.putText(reporter,"Present: "+listToString(activeSeats),(10,250), font, 4,(255,255,255),2,cv2.LINE_AA)
			# cv2.putText(reporter,"Watching: "+listToString(watchingSeats),(10,450), font, 4,(255,255,255),2,cv2.LINE_AA)
			# cv2.imshow("Report",reporter)
			
			dataFormat = ("INSERT INTO track_eyes"
			   "(TRACK_ID, THEATER_NUM, HAS_ATTENTION, TOTAL, TIMESTAMP, SEATS_OCCUPIED, SEATS_WATCHING) "
			   "VALUES (%s, %s, %s, %s, UNIX_TIMESTAMP(%s), %s, %s)")
			
			data = (0,theaterNumber,len(watchingSeats),len(activeSeats),datetime.datetime.now(),listToString(activeSeats),listToString(watchingSeats))
			cursor.execute(dataFormat,data)
			
			# Returns pressed key during wait, which is 1 second(s)
			k = cv2.waitKey(1)
			
			# If pressed key is escape, closes program
			if k%256 == 27:
				# ESC pressed
				print("Escape hit, closing...")
				cnx.close()
				cap.release()
				cv2.destroyAllWindows()
				f.close()
				break
			
			if k%256 == 32:
				#Space pressed
				showSeats = not showSeats
				print("Show Seats: {}".format(showSeats))
			
		else:
			if showSeats:
				frame = highlightSeats(frame,0,len(seatNum),x,y,w,h,seatNum,activeSeats,watchingSeats)
			cv2.imshow("Capture",frame)
			
			k = cv2.waitKey(1)
			
			if k%256 == 32:
				#Space pressed
				showSeats = not showSeats
				print("Show Seats: {}".format(showSeats))
			
			# If pressed key is escape, closes program
			if k%256 == 27:
				# ESC pressed
				print("Escape hit, closing...")
				cnx.close()
				cap.release()
				cv2.destroyAllWindows()
				f.close()
				break

if __name__== "__main__":
	main()