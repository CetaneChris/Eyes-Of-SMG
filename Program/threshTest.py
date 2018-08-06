from skimage.measure import compare_ssim
import argparse
import imutils
import cv2
import numpy as np
import sys

# Capturing webcam
cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_AUTO_EXPOSURE, 0)

# CMD String arguments
ap = argparse.ArgumentParser()
ap.add_argument("-f", "--first", required=True,
	help="first input image")
args = vars(ap.parse_args())

# Taking argument and displaying base, grayscale, and normalized
base = cv2.imread(args["first"])
cv2.imshow("base",base)
grayBase = cv2.cvtColor(base, cv2.COLOR_BGR2GRAY)
cv2.imshow("gray base",grayBase)
normBase = cv2.normalize(grayBase, None, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_32F)
cv2.imshow("norm base",normBase)

while(1):
	imgNotFound = True
	ret, frame = cap.read()
	
	#Ensuring we grab a frame
	while imgNotFound:
		k = cv2.waitKey(10) & 0xff
		ret, frame = cap.read()
		
		frameGray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
		normFrame = cv2.normalize(frameGray, None, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_32F)
		
		if ret:
			imgNotFound = False
			
	imgNotFound = True
	
	# Calculating score difference (similarity index) for base image
	(score, diff) = compare_ssim(normBase, normFrame, full=True)
	diff = (diff * 255).astype("uint8")
	
	# Normalizing the difference
	normThresh = cv2.threshold(diff, 0, 255,
	cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
		
	# Calculating score difference (similarity index) for gray image
	(score, diff) = compare_ssim(grayBase, frameGray, full=True)
	diff = (diff * 255).astype("uint8")
	
	# displaying the difference of gray image
	thresh = cv2.threshold(diff, 0, 255,
	cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
	
	# Basic image background subtracting for base, gray, and normalized
	test = base - frame
	testGray = grayBase - frameGray
	testNorm = normBase - normFrame
	
	# Showing result
	cv2.imshow("frame", frame)
	cv2.imshow("gray frame", frameGray)
	cv2.imshow("norm frame", normFrame)
	
	cv2.imshow("Normalized Threshold", normThresh)
	cv2.imshow("Unmodified Threshold", thresh)
	
	cv2.imshow("test", test)
	cv2.imshow("testGray", testGray)
	cv2.imshow("testNorm", testNorm)
	canny = cv2.Canny(base,100,200)
	
	cv2.imshow("Canny", canny)