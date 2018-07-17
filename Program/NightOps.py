from skimage.measure import compare_ssim
import argparse
import imutils
import cv2
import numpy as np
import sys
import mysql.connector
import time

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
		
def grab_frame():
	cap = cv2.VideoCapture("rtsp://admin:123456@192.168.0.29/stream0")
	
	if not cap.isOpened():
			sys.exit("Couldn't capture video source!")
			
	ret, frame = cap.read()
	
	while not ret:
		ret, frame = cap.read()
	
	cap.release()
	
	return frame
	
def stringGen(activeSeats,seatList):
	list = []
	
	for i in seatList:
		if i in activeSeats:
			list.append('PRESENT')
		else:
			list.append('EMPTY')
			
	return list
	

def main():
	# Ensures there is one argument fed into program
	ap = argparse.ArgumentParser()
	ap.add_argument("-f", "--first", required=True,
		help="first input image")
	args = vars(ap.parse_args())
	
	try:
		cnx = mysql.connector.connect(user='SeniorDesign', password='SeniorDesign',
								  host='192.241.135.75',
								  port
								  database='seniordesign')
		cursor = cnx.cursor()
		
	except mysql.connector.Error as err:
		print("AN ERROR HAS OCCURRED -")
		print(err)
	
	# Opening video source, currently the reason code will not work
	# (Zero is accessing computer's default video source, such as webcam)
	cap = cv2.VideoCapture(0)
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
		
		grayFrame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
		
		activeSeats = []
		
		for i in range(0,len(seatNum)):
			# Selecting individual seats
			subGrayBase = grayBase[int(y[i]):int(y[i])+int(h[i]), int(x[i]):int(x[i])+int(w[i])]
			subGrayFrame = grayFrame[int(y[i]):int(y[i])+int(h[i]), int(x[i]):int(x[i])+int(w[i])]
			
			# Calculating differences
			(score, diff) = compare_ssim(subGrayBase, subGrayFrame, full=True)
			diff = (diff * 255).astype("uint8")
			
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
		
		# Printing Indices 0
		#if len(activeSeats) >= 1:
			#print("{}".format(activeSeats[0]), end = "")
		
		# Printing indices greater than 0
		#for i in activeSeats[1:]:
			#print(",{}".format(i))
		
		#print(activeSeats)
		#Showing image captured
		cv2.imshow("Capture",frame)
		
		list = stringGen(activeSeats,seatList)
		
		if time.perf_counter() - clock > 5:
			clock += 5
			print("Sending seats: {}".format(activeSeats))
			dataFormat = ("INSERT INTO track_eyes "
               "(NULL, theater_num, has_attention, total, NULL, A1_status, A2_status, A3_status, A4_status, A5_status, B1_status, B2_status, B3_status, B4_status, B5_status) "
               "VALUES (NULL, %d, %d, %d, NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
			
			data = (1,0,len(activeSeats),list[0],list[1],list[2],list[3],list[4],list[5],list[6],list[7],list[8],list[9])
			
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
			
			
	

if __name__== "__main__":
	main()
	