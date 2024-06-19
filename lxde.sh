#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/LXDE/lxde_de.sh (Licensed under MIT)
echo 'Installing LXDE, please wait...'
apt install sudo -y
sudo apt-get install lxde-core lxterminal dbus-x11 tigervnc-standalone-server pulseaudio -y
sudo apt-get clean
echo 'Setting up LXDE, please wait...'
mkdir ~/.vnc

echo '#!/bin/sh
xrdb $HOME/.Xresources
startlxde
export PULSE_SERVER=127.0.0.1' >> ~/.vnc/xstartup

sudo echo '#!/usr/bin/env bash

export USER=root
export HOME=/root

vncserver -name remote-desktop -localhost no :1
echo 'VNC server address: 127.0.0.1:1' >> /usr/local/bin/start

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
