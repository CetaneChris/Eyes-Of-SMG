from skimage.measure import compare_ssim
import argparse
import imutils
import cv2
import numpy as np

def main():
	# Ensures there is one argument fed into program
	ap = argparse.ArgumentParser()
	ap.add_argument("-f", "--first", required=True,
		help="first input image")
	args = vars(ap.parse_args())

	# Explanation to user
	print("This program calibrates The Eyes of Studio Movie Grill.")
	print("In order to calibrate, input into the program an image")
	print("of the theater without anything in it. This serves as a base.")
	print("After this, have a person sit in a seat, then input that")
	print("seat number into the program. After doing this for each")
	print("seat, the main program will be calibrated and ready to perform!")
	print("When finished, enter 'done' to close the program.")

	# Opening default video recording device, returns -1 if not found
	cap = cv2.VideoCapture(0)
	if not cap.isOpened():
		return -1

	# Opening of 'Calibration.txt' file, with 'w' to write over previously written lines
	f = open('Calibration.txt','w')

	# Opening image given in arguments and making grayscale
	base = cv2.imread(args["first"])
	grayBase = cv2.cvtColor(base, cv2.COLOR_BGR2GRAY)

	while(1):
		seat = input("Enter seat: ")
		
		if seat == "done":
			break
		else:
			#Captures image from video feed and converts to grayscale
			ret, frame = cap.read()
			grayFrame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
			cv2.imshow("test", frame)
			
			#Calculates difference and records (print score for rating)
			(score, diff) = compare_ssim(grayBase, grayFrame, full=True)
			diff = (diff * 255).astype("uint8")
			
			#Threshold difference image, then find contours
			#in order to find regions that images are different
			thresh = cv2.threshold(diff, 0, 255,
			cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
			cnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL,
				cv2.CHAIN_APPROX_SIMPLE)
			cnts = cnts[0] if imutils.is_cv2() else cnts[1]
			
			maxX = 0
			maxY = 0
			maxW = 0
			maxH = 0
			# loop over the contours
			for c in cnts:
				# compute the bounding box of the contour and find max
				(x, y, w, h) = cv2.boundingRect(c)
				
				# Maintains largest surface area for seat
				if (w*h > maxW*maxH):
					maxW = w
					maxH = h
					maxX = x
					maxY = y
			
			# Outputs information of seat location to file 'Calibration.txt'
			f.write("{0} {1},{2},{3},{4}\n".format(seat, maxX, maxY, maxW, maxY))
			
	f.close()
	
if __name__== "__main__":
	main()