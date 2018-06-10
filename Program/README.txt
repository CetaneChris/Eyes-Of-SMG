This program works in two parts, and is currently not functional unless using in a theater with a default video capture device for the PC.

First part -
  calibrate.py must be run. In order to calibrate, a base image must first be captured (Suggested empty theater. Not doing this will
  greatly alter end results). After a base image is captured, the user must then run the calibration program with the base image.
  An example would be "python calibrate.py -f base.png".
  
  To finish calibrating, the user must have a single change present for one seat at a time (Suggested someone sit in each seat).
  When someone sits in each seat, the user must type in the seat name (ex: A1, G6, F11). At that point, the image difference
  will be detected and the seat will be found. Repeat this process until each seat has been located by the program.

Second part -
  This part consists of running the main program. Similar to "calibrate.py", a base image must be fed into the program, and is highly
  suggested to be the same image fed into the calibration process. After this, the program will automatically read the "Calibration.txt"
  file output by the calibration process, then go on to detect the seats occupied every 5 seconds.
  
  After the program completes one of its 5 second cycles, it will currently output to the console the seats found to be occupied.
