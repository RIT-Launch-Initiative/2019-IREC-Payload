Code for the transmitting end of the payload

System setup:
	Raspberry Pi Zero v1.3
	5.8GHz transmitter connected to pi AV out
	Raspi Camera V2


install:
	install.sh - installs necessary dependencies on the Raspberry Pi

live-demo:
	live_stream.sh - streams video to AV out
	start_camera.sh - enables CSI camera
	blank.sh - sets frame buffer of pi to 0 (black)

transmit:
	start_camer.sh - enables CSI camera
	blank.sh - clears the frame buffer
	transmit.c - transmits and records the data
	videos - the generated directory to store flight videos

	pipelines:
		pipeline.sh - sample gstreamer pipelines
		convert:
			h264tomp4.sh - converts h.264 compressed files to mp4
			raw2mp4.sh - converts raw sensor data to mp4	

demux:
	demux.sh - converts mkv to mp4 playable file
