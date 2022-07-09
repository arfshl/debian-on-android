#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Apt/Xfce4/de-apt-xfce4.sh (Licensed under GPL-2.0)
echo 'Installing XFCE, please wait...'
apt-get update
apt-get install xfce4 tightvncserver dbus-x11 -y
apt-get clean
echo 'Setting up XFCE, please wait...'
mkdir ~/.vnc
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Apt/Xfce4/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Apt/Xfce4/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Apt/Xfce4/vncserver-stop -P /usr/local/bin/
wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/restart -P /usr/local/bin
cd /usr/local/bin
mv vncserver-start start
mv vncserver-stop stop
chmod +x start
chmod +x stop
chmod +x restart
cd
chmod +x ~/.vnc/xstartup
echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
