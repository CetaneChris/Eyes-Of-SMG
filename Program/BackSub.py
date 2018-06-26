import numpy as np
import cv2

cap = cv2.VideoCapture('rtsp://admin:123456@192.168.0.29/stream0')
#fgbg = cv2.createBackgroundSubtractorMOG2()

img_counter = 0

while(1):
	ret, frame = cap.read()

	#fgmask = fgbg.apply(frame)
	
	#kernel = np.ones((4,4),np.uint8)
	#fgmask = cv2.erode(fgmask,kernel,iterations = 1)

	cv2.imshow('frame',frame)
	#cv2.imshow('fgmask',fgmask)

	k = cv2.waitKey(33) & 0xff
	if k == 27:
		break
	
	elif k%256 == 32:
		# SPACE pressed
		img_name = "opencv_frame_{}.png".format(img_counter)
		cv2.imwrite(img_name, frame)
		print("{} written!".format(img_name))
		img_counter += 1

cv2.waitKey(0)
cap.release()
cv2.destroyAllWindows()