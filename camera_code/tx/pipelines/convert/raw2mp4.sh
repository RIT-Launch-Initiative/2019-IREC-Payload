#!/bin/bash

gst-launch-1.0 filesrc location=cap.raw ! video/x-raw, width=640, height=480, framerate=30/1 ! videoconvert ! queue ! x264enc ! h264parse ! mp4mux ! filesink location=cap.mp4
