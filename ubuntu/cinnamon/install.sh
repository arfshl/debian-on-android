#!/bin/sh
# Remove mozillateam beta repository
apt-add-repository ppa:mozillateam/firefox-next -r -y
apt-add-repository ppa:mozillateam/thunderbird-next -r -y

# Remove snap override on apt
apt update && apt install wget sudo && wget https://raw.githubusercontent.com/arfshl/no-snap-on-apt/refs/heads/main/Noble/arm64/setup.sh && sh setup.sh && rm setup.sh

# Update and upgrade system
apt update && apt upgrade -y && apt autoremove -y

# Install Desktop, VNC, and basic utility
apt update && apt upgrade -y && apt install cinnamon ubuntucinnamon-environment pavucontrol dbus-x11 pulseaudio nano wget curl sudo adduser tigervnc-standalone-server -y && apt remove file-roller -y && apt autoremove -y && apt clean

# Adding user and password
sudo adduser --disabled-password --gecos "ubuntu-cinnamon" ubuntu-cinnamon && echo 'ubuntu-cinnamon:123' | chpasswd && echo 'ubuntu-cinnamon ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user

# Setup VNC server
# Create VNC configuration directory
mkdir -p /home/ubuntu-cinnamon/.vnc

# Create VNC password file (default 1234567890)
printf "1234567890" | vncpasswd -f > /home/ubuntu-cinnamon/.vnc/passwd
chmod 600 /home/ubuntu-cinnamon/.vnc/passwd

# Create VNC startup script
echo '#!/bin/sh
xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:0
dbus-launch --exit-with-session cinnamon-session' >> /home/ubuntu-cinnamon/.vnc/xstartup

# Create script for starting VNC server
echo '#!/bin/sh
export USER=ubuntu-cinnamon
export HOME=/home/ubuntu-cinnamon
vncserver -name remote-desktop -localhost no :0
echo 'VNC server address: 127.0.0.1:5900 Password: 1234567890'' >> /usr/local/bin/startvnc

# Create script for stopping VNC server
echo '#!/bin/sh
export USER=ubuntu-cinnamon
export HOME=/home/ubuntu-cinnamon
vncserver -kill :0
rm -rf /home/ubuntu-cinnamon/.vnc/localhost:0.pid
rm -rf /tmp/.X0-lock
rm -rf /tmp/.X11-unix/X0>> /usr/local/bin/stopvnc

# Create script for restarting VNC server
echo '#!/bin/sh
stopvnc
startvnc' >> /usr/local/bin/restartvnc

# Make it executable
cd /usr/local/bin
chmod +x startvnc
chmod +x stopvnc
chmod +x restartvnc
cd
chmod +x /home/ubuntu-cinnamon/.vnc/xstartup



