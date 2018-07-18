import numpy as np
import cv2 
import imutils
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier('haarcascade_eye.xml')

count=0
# OpenCV image capture
cap = cv2.VideoCapture(0)
list =[0]
while 1:
    
    ret, img = cap.read() #Grabbing image
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) # converting to grayscale
    
    faces = face_cascade.detectMultiScale(gray, 1.3, 5) # face detection
    
    
    # Putting counter on screen
    cv2.putText(img,str(count),(50,50),cv2.FONT_HERSHEY_SIMPLEX,0.5,(0,0,255),2) 
    
    #resets count t o0
    count=0
    
    #Finding face and placing rectangle over it
    for (x,y,w,h) in faces:
        cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
             
        roi_gray = gray[y:y+h, x:x+w]
        count+=1 #adds count for each face
        roi_color = img[y:y+h, x:x+w]
        eyes = eye_cascade.detectMultiScale(roi_gray)
        #Finding eyes and placing rectange over it
        for (ex,ey,ew,eh) in eyes:
            cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,255,0),2)
	            
	
    
    cv2.imshow('img',img) #Displaying image

    if(count >1):
        list.append(count) #debugging with creating list of counts greater than 1
    k = cv2.waitKey(30) & 0xff
    if k == 27:
        break #press ESC to exit program
    elif k == 32:
        print(list) #debugging/ printing list of count
    
        


cap.release()
cv2.destroyAllWindows() 
#Cleaning house
