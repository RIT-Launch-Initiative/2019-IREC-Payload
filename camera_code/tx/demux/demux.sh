#!/bin/bash

loc=$2
fps=$1

echo gst-launch-1.0 filesrc location=$loc.mkv !  matroskademux ! video/x-raw, framerate=$fps/1 ! videorate ! videoconvert ! x264enc ! h264parse ! mp4mux ! filesink location=$loc.mp4
gst-launch-1.0 filesrc location=$loc.mkv !  matroskademux ! video/x-raw, framerate=$fps/1 ! videorate ! videoconvert ! x264enc ! h264parse ! mp4mux ! filesink location=$loc.mp4
