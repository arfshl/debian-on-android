#!/bin/sh
# This script is modification of https://github.com/AndronixApp/AndronixOrigin/raw/master/WM/APT/i3.sh (Licensed under MIT)
echo "Installing i3..."
sudo apt install keyboard-configuration dialog libexo-2-0 i3 tigervnc-standalone-server nano dbus-x11 xorg xfce4-terminal thunar cairo-dock tigervnc-common --no-install-recommends -y
exho "Setting up i3..."
mkdir ~/.vnc

echo "#!/bin/bash
[ -r ~/.Xresources ] && xrdb ~/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:1
export ~/.Xauthority
dbus-launch i3
dbus-launch cairo-dock" > ~/.vnc/xstartup

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
echo 'Setting up Pulseaudio...'
echo 'export PULSE_SERVER=127.0.0.1' >> ~/.bashrc
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start