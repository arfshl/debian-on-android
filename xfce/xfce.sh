#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/XFCE4/xfce4_de.sh (Licensed under MIT)
echo 'Installing XFCE, please wait...'
apt-get install xfce4 xfce4-terminal tigervnc-standalone-server dbus-x11 pulseaudio -y
apt-get clean
echo 'Setting up XFCE, please wait...'
mkdir ~/.vnc
curl -o ~/.vnc/xstartup https://raw.githubusercontent.com/arfshl/debian-on-android/main/xfce/xstartup 
curl -o /usr/local/bin/vncserver-start https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/vncserver-start
curl -o /usr/local/bin/vncserver-stop https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/vncserver-stop 
curl -o /usr/local/bin/restart https://raw.githubusercontent.com/arfshl/debianonandroid/main/restart
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
echo 'Setting up Pulseaudio'
echo 'export PULSE_SERVER=127.0.0.1' >> ~/.bashrc
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
