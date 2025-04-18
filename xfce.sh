#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/XFCE4/xfce4_de.sh (Licensed under MIT)
echo 'Installing XFCE, please wait...'
apt install sudo addusr
sudo apt install xfce4 xfce4-terminal tigervnc-standalone-server dbus-x11 pulseaudio -y
sudo apt clean
echo 'Setting up XFCE, please wait...'
mkdir ~/.vnc

echo '#!/bin/sh
xrdb $HOME/.Xresources
startxfce4
export PULSE_SERVER=127.0.0.1' >> ~/.vnc/xstartup

echo '#!/usr/bin/env bash

export USER=root
export HOME=/root

vncserver -name remote-desktop -localhost no :1
echo 'VNC server address: 127.0.0.1:1'' >> /usr/local/bin/start 

echo '#!/usr/bin/env bash

export USER=root
export HOME=/root

vncserver -kill :1
rm -rf /root/.vnc/localhost:1.pid
rm -rf /tmp/.X1-lock
rm -rf /tmp/.X11-unix/X1' >> /usr/local/bin/stop

echo '#!/bin/sh
stop
start' >> /usr/local/bin/restart

cd /usr/local/bin
chmod +x start
chmod +x stop
chmod +x restart
cd
chmod +x ~/.vnc/xstartup
echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile
apt remove xterm -y
apt autoremove -y
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
