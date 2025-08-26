#!/bin/sh
# Remove mozillateam beta repository
apt-add-repository ppa:mozillateam/firefox-next -r -y
apt-add-repository ppa:mozillateam/thunderbird-next -r -y

# Remove snap override on apt
apt update && apt install wget sudo && wget https://raw.githubusercontent.com/arfshl/no-snap-on-apt/refs/heads/main/Noble/arm64/setup.sh && sh setup.sh && rm setup.sh

# Update and upgrade system
apt update && apt upgrade -y && apt autoremove -y

# Install XFCE desktop, VNC, and basic utility
apt install xfce4 xfce4-terminal dbus-x11 pulseaudio nano wget curl sudo adduser xdg-user-dirs-gtk xubuntu-wallpapers xfce4-whiskermenu-plugin xubuntu-icon-theme xubuntu-default-settings xubuntu-artwork tigervnc-standalone-server -y && apt clean

# Adding user and password
sudo adduser --disabled-password --gecos "ubuntu-xfce" ubuntu-xfce && echo 'ubuntu-xfce:123' | chpasswd && echo 'ubuntu-xfce ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user

# Setup VNC server
# Create VNC configuration directory
mkdir -p /home/ubuntu-xfce/.vnc

# Create VNC password file (default 1234567890)
printf "1234567890" | vncpasswd -f > /home/ubuntu-xfce/.vnc/passwd
chmod 600 /home/ubuntu-xfce/.vnc/passwd

# Create VNC startup script
echo '#!/bin/sh
xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:3
dbus-launch --exit-with-session startxfce4' >> /home/ubuntu-xfce/.vnc/xstartup

# Create script for starting VNC server
echo '#!/bin/sh
export USER=ubuntu-xfce
export HOME=/home/ubuntu-xfce
vncserver -name remote-desktop -localhost no :3
echo 'VNC server address: 127.0.0.1:3 Password: 1234567890'' >> /usr/local/bin/startvnc

# Create script for stopping VNC server
echo '#!/bin/sh
export USER=ubuntu-xfce
export HOME=/home/ubuntu-xfce
vncserver -kill :3
rm -rf /home/ubuntu-xfce/.vnc/localhost:3.pid
rm -rf /tmp/.X3-lock
rm -rf /tmp/.X11-unix/X3>> /usr/local/bin/stopvnc

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
chmod +x /home/ubuntu-xfce/.vnc/xstartup

# Install Apps
apt update && apt install chromium firefox vlc thunderbird evince ristretto galculator libheif1 xarchiver webp-pixbuf-loader fonts-liberation p7zip mousepad -y && apt clean
sudo sed -i 's|chromium --incognito %U|chromium --incognito --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium %U|chromium --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium --new-window %U|chromium --new-window --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo rm /etc/chromium/master_preferences
wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/scripts/office-online.desktop -P /usr/share/applications/





