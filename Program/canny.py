from skimage.measure import compare_ssim
import argparse
import imutils
import cv2
import numpy as np
import sys

ap = argparse.ArgumentParser()
ap.add_argument("-f", "--first", required=True,
	help="first input image")
args = vars(ap.parse_args())

base = cv2.imread(args["first"])
grayBase = cv2.cvtColor(base, cv2.COLOR_BGR2GRAY)
cannyBase = cv2.Canny(grayBase,80,80) #min max (Temp)

# Capturing webcam
cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_AUTO_EXPOSURE, 0)

max = 200
min = 100
erodeIteration = 1

eKernel = np.ones((2,2),np.uint8)
dKernel = np.ones((2,2),np.uint8)

while(1):
	imgNotFound = True
	ret, frame = cap.read()
	
	#Ensuring we grab a frame
	while imgNotFound:
		k = cv2.waitKey(10) & 0xff
		ret, frame = cap.read()
		
		frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
		cannyFrame = cv2.Canny(frame,80,80)
		#frame = cv2.normalize(frameGray, None, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_32F)
		
		if ret:
			imgNotFound = False
			
	imgNotFound = True
	
	canny = cv2.Canny(frame,min,max)
	opening = cv2.morphologyEx(canny,cv2.MORPH_OPEN, eKernel)
	closing = cv2.morphologyEx(canny,cv2.MORPH_CLOSE, dKernel)
	erosion = cv2.erode(canny,eKernel,erodeIteration)
	dilation = cv2.dilate(canny,dKernel,erodeIteration)
	
	test = cv2.erode(closing,eKernel,erodeIteration)
	
	(score, diff) = compare_ssim(cannyBase, cannyFrame, full=True)
	diff = (diff * 255).astype("uint8")
	
	thresh = cv2.threshold(diff, 0, 255,
		cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
	
	
	cv2.imshow("Canny",canny)
	cv2.imshow("Base Frame", frame)
	cv2.imshow("Opened", opening)
	cv2.imshow("Erosion",erosion)
	cv2.imshow("Dilation",dilation)
	cv2.imshow("Close",closing)
	cv2.imshow("test",thresh)
	
	cv2.waitKey(10) & 0xff
	
	if k%256 == 119:
		# 'w' pressed
		max += 5
		print(max)
	
	elif k%256 == 115:
		# 's' pressed
		max -= 5
		print(max)
		
	elif k%256 == 97:
		# 'a' pressed
		min -= 5
		print(min)
	
	elif k%256 == 100:
		# 'd' pressed
		min += 5
		print(min)
		
	elif k%256 == 113:
		# 'q' pressed
		erodeIteration -= 1
		print(erodeIteration)
		
	elif k%256 == 101:
		#'e' pressed
		erodeIteration += 1
		print(erodeIteration)