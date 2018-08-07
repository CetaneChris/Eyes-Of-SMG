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
def coordinates(string):
	nameCoord = string.split(" ")
	
	# Checks if size is the expected size
	if len(nameCoord) == 2:
		#Splitting the second argument of nameCoord, which are the coordinates
		coord = nameCoord[1].split(",")
		
		# Checks if size is the expected size
		if len(coord) == 4:
			# Seat, x, y, w, h
			return nameCoord[0],coord[0], coord[1], coord[2], coord[3]
			
		else:
			sys.exit("Error with size of coord!{}".format(coord))
		
	else:
		sys.exit("Error with size of nameCoord!{}".format(nameCoord))
		

def seatAttend(activeSeats,seatList):
	list = []
	
	#print(seatList)
	#print(activeSeats)
	
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
	face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_alt.xml')
	
	faces = face_cascade.detectMultiScale(frame, 1.15, 5) # face detection
	
	if len(faces) > 0:
		return True
	else:
		return False

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
	
	# Opening video source, currently the reason code will not work
	# (Zero is accessing computer's default video source, such as webcam)
	cap = cv2.VideoCapture("rtsp://admin:123456@"+args["second"]+"/stream0")
	if not cap.isOpened():
			sys.exit("Couldn't capture video source!")

	# Reads the calibration file and saves each line as a string in a string array
	# seatFile = open('Calibration.txt','r')
	# seatList = seatFile.read()
	
	with open('Calibration.txt') as f:
		seatList = f.readlines()
		
	seatList = [x.strip() for x in seatList] #Removes new line character
	
	# Reading base image
	base = cv2.imread(args["first"])
	grayBase = cv2.cvtColor(base, cv2.COLOR_BGR2GRAY)
	
	# Preparing arrays to be filled with seats / coordinates of seats
	seatNum = []
	x = []
	y = []
	w = []
	h = []
	
	# Loading arrays with data from Calibration.txt
	for i in seatList:
		#print(seatList)
		#print(i)
		#print(seatList[i])
		seatTemp,xTemp,yTemp,wTemp,hTemp = coordinates(i)
		
		seatNum.append(seatTemp)
		x.append(xTemp)
		y.append(yTemp)
		w.append(wTemp)
		h.append(hTemp)
		
	#Set seat visibility
	showSeats = False
	imgNotFound = True #Currently needing to implement the try catch in calibrate.py
	
	clock = 0
	
	# Looping through for each seat
	while True:
		# Read the current frame
		while imgNotFound:
			try:
				k = cv2.waitKey(10) & 0xff
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
		imgNotFound = True
		
		if time.perf_counter() - clock > 5:
			clock += 5
			grayFrame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
			
			activeSeats = []
			watchingSeats = []
			
			for i in range(0,len(seatNum)):
				# Selecting individual seats
				subGrayBase = grayBase[int(y[i]):int(y[i])+int(h[i]), int(x[i]):int(x[i])+int(w[i])]
				subGrayFrame = grayFrame[int(y[i]):int(y[i])+int(h[i]), int(x[i]):int(x[i])+int(w[i])]
				subFrame = frame[int(y[i]):int(y[i])+int(h[i]), int(x[i]):int(x[i])+int(w[i])]
				
				# Calculating differences
				(score, diff) = compare_ssim(subGrayBase, subGrayFrame, full=True)
				# diff = (diff * 255).astype("uint8")
				
				if showSeats:
					cv2.rectangle(frame, (int(x[i]), int(y[i])), (int(x[i]) + int(w[i]), int(y[i]) + int(h[i])), (0, 0, 255), 2)
				
				# This segment of code will better show differences if enabled
				# thresh = cv2.threshold(diff, 0, 255,
				# cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
				# cv2.imshow("Thresh", thresh)
				
				# Deciding factor as to whether or not a seat is occupied
				# If not picking up on someone in seat, decrease threshold
				# If selection is too sensitive, increase threshold
				if score < .75:
					activeSeats.append(seatNum[i])
					
					if detectFaces(subFrame):
						watchingSeats.append(seatNum[i])
			
			
			#Showing image captured
			cv2.imshow("Capture",frame)
			
			print("Sending seats: {}".format(activeSeats))
			print("Faces found in seats: {}".format(watchingSeats))
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
				for i in range(0,len(seatNum)):
					cv2.rectangle(frame, (int(x[i]), int(y[i])), (int(x[i]) + int(w[i]), int(y[i]) + int(h[i])), (0, 0, 255), 2)
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
	
