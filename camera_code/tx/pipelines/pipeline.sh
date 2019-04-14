#!/bin/bash

#gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480, framerate=30/1 ! videorate ! videoconvert ! queue ! x264enc ! video/x-h264, width=640, height=480, target-bitrate=8000000, control-rate=variable ! queue ! filesink location=cap.h264

#gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480, framerate=30/1 ! videorate ! queue ! filesink location=cap.raw

#gst-launch-1.0 -e v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480, framerate=30/1 ! videoconvert ! queue ! x264enc ! h264parse ! mp4mux ! filesink location=cap.mp4

#gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480, framerate=30/1 ! queue ! videoconvert ! videorate ! x264enc ! h264parse ! filesink location=cap.h264

gst-launch-1.0 v4l2src device=/dev/video0 ! tee name=t t. ! queue ! video/x-raw, width=640, height=480, framerate=30/1, target-bitrate=8000000 ! videoconvert ! queue ! videorate ! matroskamux ! filesink location=cap.mkv t. ! queue ! videoconvert ! xvimagesink
