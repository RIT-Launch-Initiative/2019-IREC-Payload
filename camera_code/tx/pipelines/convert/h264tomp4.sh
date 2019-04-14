#!/bin/bash

gst-launch-1.0 filesrc location=cap.h264 ! video/x-h264, width=640, height=480, target-bitrate=8000000, control-rate=variable ! h264parse ! mp4mux ! queue ! filesink location=cap.mp4
