#!/bin/sh
# This script is modification of https://github.com/AndronixApp/AndronixOrigin/raw/master/WM/APT/awesome.sh (Licensed under MIT)
echo "Installing Awesome..."
apt install sudo addusr -y
sudo apt install keyboard-configuration tzdata dialog awesome tigervnc-standalone-server nano dbus-x11 xorg xfce4-terminal thunar libexo-2-0 cairo-dock pulseaudio --no-install-recommends -y
sudo apt-get clean
echo "Setting up Awesome..."
mkdir ~/.vnc

echo "#!/bin/bash
[ -r ~/.Xresources ] && xrdb ~/.Xresources
export ~/.Xauthority
dbus-launch awesome
export PULSE_SERVER=127.0.0.1
dbus-launch cairo-dock" > ~/.vnc/xstartup

sudo echo '#!/usr/bin/env bash

export USER=root
export HOME=/root

vncserver -name remote-desktop -localhost no :1
echo 'VNC server address: 127.0.0.1:1''>> /usr/local/bin/start 

sudo echo '#!/usr/bin/env bash

export USER=root
export HOME=/root

vncserver -kill :1
rm -rf /root/.vnc/localhost:1.pid
rm -rf /tmp/.X1-lock
rm -rf /tmp/.X11-unix/X1' >> /usr/local/bin/stop

sudo echo '#!/bin/sh
stop
start' >> /usr/local/bin/restart

cd /usr/local/bin
sudo chmod +x start
sudo chmod +x stop
sudo chmod +x restart
cd
chmod +x ~/.vnc/xstartup
sudo echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile
sudo apt remove xterm -y
sudo apt autoremove -y
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
