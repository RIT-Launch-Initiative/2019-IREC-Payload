echo "Installing camera software"

sudo apt-get update
echo "updated system"

sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools
echo "gstreamer installed"

#sudo apt-get install omxplayer
#echo "omxplayer installed"

sudo apt-get install vim
echo "vim installed"

sudo apt-get install python3-pip
echo "pip installed"

pip install gi
echo "gi python dependency installed"

sudo raspi-config
echo "make sure camera selection was changed to 'yes'"

sudo apt-get install opencv-python
sudo apt-get install raspivid


#INSTALLING CAMERA DRIVER#
sudo rpi-update
sudo modprobe bcm2835-v4l


sudo apt-get install sl
sl
echo "choo choo"

echo "must reboot"

#make sure to comment out
#hdmi hotplug line in /boot/config.txt
#to use tv out
