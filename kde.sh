#!/bin/bash
# This script is modification of https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Scripts/DesktopEnvironment/Heavy/KDE/Ubuntu/de-ubuntu-kde.sh (Licensed under GPL-2.0)
echo 'Installing KDE, please wait...'
apt-get install xorg kde-plasma-desktop tigervnc-standalone-server dbus-x11 -y
echo "Proccesing command provided by @maalos, this fixed error in Ubuntu 20 Focal."
rm /var/lib/dpkg/info/fprintd.postinst
rm /var/lib/dpkg/info/libfprint*.postinst
rm /var/lib/dpkg/info/libpam-fprintd*.postinst
dpkg --configure -a
echo 'Done'
apt-get clean
echo 'Setting up KDE, please wait...'
mkdir ~/.vnc
wget https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Scripts/DesktopEnvironment/Heavy/KDE/Ubuntu/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/arfshl/debian-on-android/main/kde/startkde -P /usr/local/bin/
wget https://raw.githubusercontent.com/arfshl/debian-on-android/main/kde/stopkde -P /usr/local/bin/
wget https://raw.githubusercontent.com/arfshl/debian-on-android/main/restart -P /usr/local/bin/
cd /usr/local/bin
mv startkde start
mv stopkde stop
chmod +x start
chmod +x stop
chmod +x restart
cd
chmod +x ~/.vnc/xstartup
echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile
apt remove konqueror plasama-discover partitionmanager kdeconnect termit kwalletmanager -y
apt autoremove -y
passwd
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
