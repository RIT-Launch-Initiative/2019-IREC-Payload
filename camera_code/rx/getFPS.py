#!/usr/bin/python

import cv2
import time

id = -1
while(id == -1):
    try:
        id = int(input("Input Device ID: "))
    except:
        print("ID must be an integer")
        id = -1

vc = cv2.VideoCapture(id)

num_trials = 200
trial_range = range(0, num_trials)

start = time.time()

for i in trial_range:
    _,frame = vc.read()

end = time.time()
vc.release()

time_elapsed = end-start
print("Time Elapsed: "+str(time_elapsed))

fps = num_trials/time_elapsed

print("Calculated FPS: "+str(fps))
