#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/LXDE/lxde_de.sh (Licensed under MIT)
echo 'Installing LXDE, please wait...'
apt-get install lxde-core lxterminal dbus-x11 tigervnc-standalone-server pulseaudio -y
apt-get clean
echo 'Setting up LXDE, please wait...'
mkdir ~/.vnc
wget https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxde/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXDE/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXDE/vncserver-stop -P /usr/local/bin/
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
echo 'Setting up Pulseaudio'
echo 'export PULSE_SERVER=127.0.0.1' >> ~/.bashrc
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
