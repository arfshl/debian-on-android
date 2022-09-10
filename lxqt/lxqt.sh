#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/APT/LXQT/lxqt_de.sh (Licensed under MIT)
echo 'Installing LXQt, please wait...'
apt-get install lxqt-core lxqt-config dbus-x11 qterminal tigervnc-standalone-server pulseaudio -y
apt-get clean
echo 'Setting up LXQt, please wait...'
mkdir ~/.vnc
curl -o ~/.vnc/xstartup https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxqt/xstartup
curl -o /usr/local/bin/vncserver-start https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXQT/vncserver-start  
curl -o /usr/local/bin/vncserver-stop https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXQT/vncserver-stop
curl -o /usr/local/bin/restart https://raw.githubusercontent.com/arfshl/debian-on-android/main/restart
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
