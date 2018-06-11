from skimage.measure import compare_ssim
import argparse
import imutils
import cv2
import numpy as np
import sys

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

def main():
	# Ensures there is one argument fed into program
	ap = argparse.ArgumentParser()
	ap.add_argument("-f", "--first", required=True,
		help="first input image")
	args = vars(ap.parse_args())
	
	# Opening video source, currently the reason code will not work
	# (Zero is accessing computer's default video source, such as webcam)
	cap = cv2.VideoCapture(0)
	if not cap.isOpened():
			sys.exit("Couldn't capture video source!")

	# Reads the calibration file and saves each line as a string in a string array
	seatFile = open('Calibration.txt','r')
	seatList = file.read()
	
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
		seatTemp,xTemp,yTemp,wTemp,hTemp = coordinates(seatList[i])
		
		seatNum.append(seatTemp)
		x.append(xTemp)
		y.append(yTemp)
		w.append(wTemp)
		h.append(hTemp)
	
	# Looping through for each seat
	while true:
		# Read the current frame
		ret, frame = cap.read()
		grayFrame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
		
		activeSeats = []
		
		for i in seatNum:
			# Selecting individual seats
			subGrayBase = grayBase[y[i]:y[i]+h[i], x[i]:x[i]+w[i]]
			subGrayFrame = grayFrame[y[i]:y[i]+h[i], x[i]:x[i]+w[i]]
			
			# Calculating differences
			(score, diff) = compare_ssim(subGrayBase, subGrayFrame, full=True)
			diff = (diff * 255).astype("uint8")
			
			# This segment of code will better show differences if enabled
			# thresh = cv2.threshold(diff, 0, 255,
			# cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
			# cv2.imshow("Thresh", thresh)
			
			# Deciding factor as to whether or not a seat is occupied
			# If not picking up on someone in seat, decrease threshold
			# If selection is too sensitive, increase threshold
			# Threshold is currently .85
			if score < .85:
				activeSeats.append(seatNum[i])
		
		# Printing Indices 0
		if len(activeSeats) >= 1
			print("{}".format(activeSeats[0]))
		
		# Printing indices greater than 0
		for i in activeSeats[1:]:
			print(",{}".format(activeSeats[i]))
		
		# Returns pressed key during wait, which is 5 seconds
		k = cv2.waitKey(5000)
		
		# If pressed key is escape, closes program
		if k%256 == 27:
			# ESC pressed
			print("Escape hit, closing...")
			break
	

if __name__== "__main__":
	main()
	
