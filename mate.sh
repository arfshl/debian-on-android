#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/MATE/mate_de.sh (Licensed under GPL-2.0)
echo 'Installing MATE, please wait...'
apt-get install mate-desktop-environment-core tigervnc-standalone-server dbus-x11 -y
apt-get clean
echo 'Setting up MATE, please wait...'
mkdir ~/.vnc
wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/MATE/vncserver-stop -P ~/.vnc/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/MATE/xstartup -P /usr/local/bin/
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
apt remove xterm -y
apt autoremove -y
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
