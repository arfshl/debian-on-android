#!/bin/sh
# Remove mozillateam beta repository
apt-add-repository ppa:mozillateam/firefox-next -r -y
apt-add-repository ppa:mozillateam/thunderbird-next -r -y

# Add mozilla official repository 
apt install sudo -y
echo 'Adding Mozilla Repository...'
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
sudo echo 'deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main' >> /etc/apt/sources.list.d/mozilla.list
echo 'Adding Mozillateam PPA...'
sudo add-apt-repository ppa:mozillateam/ppa -y
echo 'Configuring APT Pinning...'
sudo echo 'Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1001


Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1000


Package: firefox
Pin: release o=Ubuntu
Pin-Priority: -1


Package: thunderbird
Pin: release o=Ubuntu
Pin-Priority: -1' >> /etc/apt/preferences.d/mozilla
echo 'Done'

# Update and upgrade system
apt update && apt upgrade -y && apt autoremove -y

# Install Desktop, VNC, and basic utility
apt install mate-desktop-environment-core caja mate-menus mate-terminal mate-applet-brisk-menu mate-backgrounds mate-dock-applet mate-indicator-applet mate-menus pavucontrol mate-indicator-applet-common mate-tweak mate-applets ubuntu-mate-artwork ubuntu-mate-default-settings ubuntu-mate-icon-themes ubuntu-mate-themes ubuntu-mate-wallpapers ubuntu-mate-wallpapers-common ubuntu-mate-lightdm-theme dbus-x11 pulseaudio nano wget curl sudo adduser tigervnc-standalone-server -y && apt clean

# Adding user and password
sudo adduser --disabled-password --gecos "ubuntu-mate" ubuntu-mate && echo 'ubuntu-mate:123' | chpasswd && echo 'ubuntu-mate ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user

# Setup VNC server
# Create VNC configuration directory
mkdir -p /home/ubuntu-mate/.vnc

# Create VNC password file (default 1234567890)
printf "1234567890" | vncpasswd -f > /home/ubuntu-mate/.vnc/passwd
chmod 600 /home/ubuntu-mate/.vnc/passwd

# Create VNC startup script
echo '#!/bin/sh
xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:0
dbus-launch --exit-with-session mate-session' >> /home/ubuntu-mate/.vnc/xstartup

# Create script for starting VNC server
echo "#!/bin/sh
export USER=ubuntu-mate
export HOME=/home/ubuntu-mate
vncserver -name remote-desktop -localhost no :0
echo 'VNC server address: 127.0.0.1:5900 Password: 1234567890'" >> /usr/local/bin/startvnc

# Create script for stopping VNC server
echo '#!/bin/sh
export USER=ubuntu-mate
export HOME=/home/ubuntu-mate
vncserver -kill :0
rm -rf /home/ubuntu-mate/.vnc/localhost:0.pid
rm -rf /tmp/.X0-lock
rm -rf /tmp/.X11-unix/X0' >> /usr/local/bin/stopvnc

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
chmod +x /home/ubuntu-mate/.vnc/xstartup



