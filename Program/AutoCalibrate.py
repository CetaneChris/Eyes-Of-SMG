from skimage.measure import compare_ssim
import argparse
import imutils
import cv2
import numpy as np
import sys

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
		print("Did not access device!")
		return -1

	# Opening of 'Calibration.txt' file, with 'w' to write over previously written lines
	f = open('Calibration.txt','w')

	# Opening image given in arguments and making grayscale
	base = cv2.imread(args["first"])
	grayBase = cv2.cvtColor(base, cv2.COLOR_BGR2GRAY)
	grayBase = cv2.normalize(grayBase, None, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_32F)
	
	imgNotFound = True
	counter = 0
	listSeats = []
	listX = []
	listY = []
	listW = []
	listH = []

	while(1):
		while imgNotFound:
			try:
				k = cv2.waitKey(30) & 0xff
				ret, frame = cap.read()
				frameGray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
				normFrame = cv2.normalize(frameGray, None, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_32F)
				if ret:
					cv2.imshow("Calibration", normFrame)
					#height, width, channels = frame.shape
					imgNotFound = False
			
			except AttributeError:
				print("Attribute Error (Frame lost?)")
			
			except AssertionError:
				print("Assertion Error, empty frame")
				cap.release()
				cap = cv2.VideoCapture("rtsp://admin:123456@192.168.1.23/stream0")
				
			except KeyboardInterrupt:
				print("Keyboard Interrupt, ending program...")
				break
			
			except:
				print("Unknown Error occured")
				
		imgNotFound = True
		
		#k = cv2.waitKey(30) & 0xff
	
		if k == 27:
			#ESC Pressed
			sys.exit("Calibration ended early! May have issues!")
		elif k%256 == 32:
			#Space Pressed
		
			#Captures image from video feed and converts to grayscale
			#grayFrame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
			
			seat = input("Enter seat: ")
			if seat == "done":
				break
			
			listSeats.append(seat)
			
			#Calculates difference and records (print score for rating)
			(score, diff) = compare_ssim(grayBase, normFrame, full=True)
			diff = (diff * 255).astype("uint8")
			
			#Threshold difference image, then find contours
			#in order to find regions that images are different
			thresh = cv2.threshold(diff, 0, 255,
			cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
			cnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL,
				cv2.CHAIN_APPROX_SIMPLE)
			cnts = cnts[0] if imutils.is_cv2() else cnts[1]
			
			
			cv2.imshow("thresh", thresh)
			
			maxX = 0
			maxY = 0
			maxW = 0
			maxH = 0
			# loop over the contours
			for c in cnts:
				# compute the bounding box of the contour and find max
				x, y, w, h = cv2.boundingRect(c)
				
				# Maintains largest surface area for seat
				if (w*h > maxW*maxH):
					maxW = w
					maxH = h
					maxX = x
					maxY = y
			
			#Saving of ROI
			listX.append(maxX)
			listY.append(maxY)
			listW.append(maxW)
			listH.append(maxH)
			
			#Shows the user the found ROI, for confirmation
			cv2.rectangle(normFrame, (maxX, maxY), (maxX + maxW, maxY + maxH), (255, 255, 255), 2)
			cv2.imshow("Calibration", normFrame)
			cv2.waitKey(3000)
			
	#Iterates through saved ROI and writes them to file specified by variable 'f'
	i = 0
	for seats in range(len(listSeats)):
		f.write("{0} {1},{2},{3},{4}\n".format(listSeats[i], listX[i], listY[i], listW[i], listH[i]))
		cv2.rectangle(normFrame, (listX[i], listY[i]), (listX[i] + listW[i], listY[i] + listH[i]), (255, 255, 255), 2)
		i += 1
			
	#Wrapping up feeds and files, shows final calibration
	f.close()
	cap.release()
	print("Calibration finished properly! Check 'Calibration.txt'")
	cv2.imshow("Calibration", normFrame)
	cv2.waitKey(8000)
	
if __name__== "__main__":
	main()
