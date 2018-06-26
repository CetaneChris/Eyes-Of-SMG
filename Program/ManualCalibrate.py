import cv2
import numpy as np
import sys

#Setting of global variables used to tranfer data to/from mouse event
tempX,tempY = 0,0 #Crop
width,height = 0,0 #Crop
sectionReady = False #Crop ready
drawX,drawY = 0,0 #Used to show current selection before finalizing
drawing = False


#Function handles operations on mouse events, currently selecting ROI & showing w/ red rectangle
def mouse_event(event,x,y,flags,param):
	global tempX, tempY, width, height, sectionReady, drawing,drawX,drawY
	
	# Start ROI Selection (Selecting first set of bounds)
	if event == cv2.EVENT_LBUTTONDOWN:
		tempX = x
		tempY = y
		drawX,drawY = x,y #Cleaner initial interface, ensures no random lines on click (On rectangle display)
		drawing = True #Start drawing rectangles
		
	# Adjust second set of bounds while mouse LBUTTONDOWN
	elif event == cv2.EVENT_MOUSEMOVE:
		if drawing:
			drawX,drawY = x,y #second set of bounds for drawing rectangle
	
	# Finalizing of selected area
	elif event == cv2.EVENT_LBUTTONUP:
		width = x - tempX
		height = y - tempY
		sectionReady = True
		drawing = False

def main():
	global sectionReady,drawX,drawY,tempX,tempY
	
	#Capturing video feed
	cap = cv2.VideoCapture("rtsp://admin:123456@192.168.0.29/stream0")
	if not cap.isOpened():
		print("Did not access device!")
		return -1
	
	#Name of calibration file to be written to
	f = open('Calibration.txt','w')
	
	#Taking number of seats
	seatCount = input("Number of seats: ")
	
	#Preparation for seat listing and bounds
	i = 0
	seatList = []
	x = []
	y = []
	w = []
	h = []
	
	# Takes and stores names of each seat in order
	while i < int(seatCount):
		seat = input("Name of seat {}: ".format(i+1))
		seatList.append(seat)
		i += 1
	
	#Setting up mouse_event attachment to 'Calibration' window
	cv2.namedWindow('Calibration')
	cv2.setMouseCallback('Calibration',mouse_event)
	
	#Preparation for finding bounds of seats
	imgNotFound = True
	i = 0
	
	while i < len(seatList):
		# Continues to go through video feed until appropriate frame is found
		while imgNotFound:
			try:
				k = cv2.waitKey(30) & 0xff
				ret, frame = cap.read()
				if drawing:
					cv2.rectangle(frame, (tempX, tempY), (drawX, drawY), (0, 0, 255), 2) #Showing non-finalized ROI
				cv2.imshow("Calibration", frame)
				imgNotFound = False
			
			except AttributeError:
				print("Attribute Error (Frame lost?)")
				
			except AssertionError: #Refreshes pipiline
				print("Assertion Error, empty frame")
				cap.release()
				cap = cv2.VideoCapture("rtsp://admin:123456@192.168.0.29/stream0")
			
			except KeyboardInterrupt:
				print("Keyboard Interrupt, ending program...")
				sys.exit("Calibration ended early! May have issues!")
				
			except:
				print("Unknown Error Occured...")
	
		imgNotFound = True
		
		if k == 27:
			#ESC Pressed, exits program
			sys.exit("Calibration ended early! May have issues!")
			
		elif k%256 == 32:
			# Space Pressed, shows seats
			j = 0
			while j < len(x):
				cv2.rectangle(frame, (x[j], y[j]), (x[j] + w[j], y[j] + h[j]), (0, 0, 255), 2)
				j+=1
				
			cv2.imshow("Calibration", frame)
			print("Showing seats...")
			cv2.waitKey(3000)
			
		elif k%256 == 8:
			#Backspace pressed, removes most recently added seat
			if i > 0:
				i-=1
				print("Seat {} removed!".format(seatList[i]))
				x.pop(i)
				y.pop(i)
				w.pop(i)
				h.pop(i)
				
			else:
				print("No more seats to remove!")
				
		#When ROI Finalized, Dimensions saved here
		if sectionReady:
			print("Seat {} Set!".format(seatList[i]))
			x.append(tempX)
			y.append(tempY)
			w.append(width)
			h.append(height)
			i += 1
			sectionReady = False
	
	#Writing saved ROI to file specified with variable 'f'
	i = 0
	for seats in range(len(seatList)):
		f.write("{0} {1},{2},{3},{4}\n".format(seatList[i], x[i], y[i], w[i], h[i]))
		cv2.rectangle(frame, (x[i], y[i]), (x[i] + w[i], y[i] + h[i]), (60, 100, 60), 2)
		i += 1
	
	#Wrapping up feeds and files, shows final calibration
	cap.release()
	f.close()
	print("Calibration finished properly! Check 'Calibration.txt'")
	cv2.imshow("Calibration", frame)
	cv2.waitKey(8000)
	
if __name__== "__main__":
	main()