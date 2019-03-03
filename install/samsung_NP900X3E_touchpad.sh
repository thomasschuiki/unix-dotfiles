# configure input devices
#####
#Touchpad
# determine the type of touchpad
egrep -i 'synap|alps|etps|elan' /proc/bus/input/devices

# we need to edit/create files in /etc/X11/xorg.conf.d 
# session config is stored in /usr/share/X11/xorg.conf.d/
# we create 40-libinput.conf to hold our config
mkdir -p /etc/X11/xorg.conf.d
echo 'Section "InputClass"
      Identifier "libinput touchpad catchall"
      MatchIsTouchpad "on"
      MatchDevicePath "/dev/input/event*"
      Driver "libinput"
      Option "Tapping" "on"
	  Option "TapButton1" "1"
      Option "TapButton2" "2"     # multitouch
      Option "TapButton3" "3"     # multitouch
      Option "VertTwoFingerScroll" "1"     # multitouch
	  Option "PalmDetect" "1"
EndSection' > /etc/X11/xorg.conf.d/40-libinput.conf

