#!/bin/sh
# This script is modification of https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Scripts/DesktopEnvironment/Heavy/KDE/Ubuntu/de-ubuntu-kde.sh (Licensed under GPL-2.0)
echo 'Installing KDE, please wait...'
apt install sudo
sudo apt-get install xorg kde-plasma-desktop tigervnc-standalone-server dbus-x11 pulseaudio -y
sudo apt-get clean
echo "Proccesing command provided by @maalos, this fixed error in Ubuntu 20 Focal."
sudo rm /var/lib/dpkg/info/fprintd.postinst
sudo rm /var/lib/dpkg/info/libfprint*.postinst
sudo rm /var/lib/dpkg/info/libpam-fprintd*.postinst
sudo dpkg --configure -a
echo 'Done'
echo 'Setting up KDE, please wait...'
mkdir ~/.vnc

echo '#!/bin/bash
xrdb $HOME/.Xresources
dbus-launch startplasma-x11
export PULSE_SERVER=127.0.0.1' >> ~/.vnc/xstartup

sudo echo '#!/bin/sh
export USER=root
export HOME=/root

case `uname -m` in
	aarch64)
		archurl="aarch64" ;;
	arm*)
		archurl="arm" ;;
	amd64)
		archurl="x86_64" ;;
	x86_64)
		archurl="x86_64" ;;	
	i*86)
		archurl="i386" ;;
	x86)
		archurl="i386" ;;
	*)
		echo "unknown architecture"; exit 1 ;;
	esac

LD_PRELOAD=/lib/${archurl}-linux-gnu/libgcc_s.so.1 vncserver -name remote-desktop -localhost no :1' >> /usr/local/bin/start
echo 'VNC server address: 127.0.0.1:1'8

sudo echo '#!/bin/sh
export USER=root
export HOME=/root

vncserver -kill :1
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
sudo apt remove konqueror ksysguard plasma-discover partitionmanager kdeconnect termit kwalletmanager -y
sudo apt autoremove -y
passwd
echo 'Starting up VNC Server'
echo 'To start VNC server use start command'
echo 'To stop VNC server use stop command'
echo 'To restart VNC server use restart command'
start
