#!/usr/bin/python3
"""
Stream camera feed from IREC 2109 payload
Uses USB 5.8GHz receiver and the v4l2 library

author: Will Merges, RIT Launch Initiative
"""
import cv2
import os
import sys

try:
    id = int(sys.argv[1])
    fps = int(sys.argv[2])
except:
    print("receiver ID and fps must be an integer")
    sys.exit()

outfile = "out.mp4"
if len(sys.argv) > 3:
    outfile = sys.argv[3]
    if(outfile.rfind(".mp4") == len(outfile)-4):
        print("writing to "+outfile)
    else:
        print("outfile must be a .mp4")
        outfile = "out.mp4"
        print("writing to 'out.mp4' instead")
else:
    print("no outfile supplied, writing to 'out.mp4'")


os.system("mkdir -p videos")

vc = cv2.VideoCapture(id)
fourcc = cv2.VideoWriter_fourcc(*'MP4V')
out = cv2.VideoWriter("videos/"+outfile, fourcc, float(fps), (640, 480))


while 1:
    _,frame = vc.read()

    frame = cv2.flip(frame, 1)

    out.write(frame)

    frame = cv2.resize(frame, (640*2, 480*2))
    cv2.imshow("device: "+str(id), frame)

    if cv2.waitKey(33) == 27: #esc
        break

vc.release()
out.release()
cv2.destroyAllWindows()
