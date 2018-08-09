import numpy as np
import cv2
import argparse

ap = argparse.ArgumentParser()
ap.add_argument("-f", "--first", required=True,
	help="Camera IP Address")
args = vars(ap.parse_args())

cap = cv2.VideoCapture("rtsp://admin:123456@"+args["first"]+"/stream0")
if not cap.isOpened():
	sys.exit("Couldn't capture video source!")
#fgbg = cv2.createBackgroundSubtractorMOG2()

img_counter = 0

while(1):
	imgNotFound = True
	ret, frame = cap.read()
	while imgNotFound:
		k = cv2.waitKey(10) & 0xff
		#cap.set(1,0)
		ret, frame = cap.read()
		if ret:
			#cv2.imshow("NightOps", frame)
			#height, width, channels = frame.shape\
			
			#frameGray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
			#normFrame = cv2.normalize(frameGray, None, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_32F)
			#equ = cv2.equalizeHist(frameGray)
			#res = np.hstack((frame,equ))
			imgNotFound = False

	imgNotFound = True
	frame = cv2.normalize(frame, None, 0, 255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)
	#fgmask = fgbg.apply(frame)
	
	#kernel = np.ones((4,4),np.uint8)
	#fgmask = cv2.erode(fgmask,kernel,iterations = 1)

	cv2.imshow('frame',frame)
	#cv2.imshow('frameGray', frameGray)
	#cv2.imshow('normFrame',normFrame)
	#cv2.imshow('equ',equ)
	#cv2.imshow('fgmask',fgmask)

	k = cv2.waitKey(10) & 0xff
	if k == 27:
		break
	
	elif k%256 == 32:
		# SPACE pressed
		img_name = args["first"]+"_{}.png".format(img_counter)
		cv2.imwrite(img_name, frame)
		print("{} written!".format(img_name))
		img_counter += 1

cv2.waitKey(0)
cap.release()
cv2.destroyAllWindows()