#!/bin/sh
# Add mozilla official repository 
apt install sudo -y
echo 'Adding Mozilla Repository...'
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
sudo echo 'deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main' >> /etc/apt/sources.list.d/mozilla.list
echo 'Configuring APT Pinning...'
sudo echo 'Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1001' >> /etc/apt/preferences.d/mozilla
echo 'Done'

# Update and upgrade system
apt update && apt upgrade -y && apt autoremove -y

# Install Desktop, VNC, and basic utility
apt update && apt upgrade -y && apt install kde-plasma-desktop dbus-x11 pulseaudio nano wget curl sudo adduser pavucontrol-qt tigervnc-standalone-server -y && apt remove firefox-esr konqueror ksysguard plasma-discover partitionmanager kdeconnect termit kwalletmanager -y && apt autoremove -y && apt clean
kwriteconfig5 --file kscreensaverrc --group Daemon --key Autolock false
kwriteconfig5 --file kscreensaverrc --group Daemon --key Lock false
kwriteconfig5 --file kscreenlockerrc --group Daemon --key Autolock false

# Adding user and password
sudo adduser --disabled-password --gecos "debian-kde" debian-kde && echo 'debian-kde:123' | chpasswd && echo 'debian-kde ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user

# Setup VNC server
# Create VNC configuration directory
mkdir -p /home/debian-kde/.vnc

# Create VNC password file (default 1234567890)
printf "1234567890" | vncpasswd -f > /home/debian-kde/.vnc/passwd
chmod 600 /home/debian-kde/.vnc/passwd

# Create VNC startup script
echo '#!/bin/sh
xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:0
dbus-launch --exit-with-session startplasma-x11' >> /home/debian-kde/.vnc/xstartup

# Create script for starting VNC server
echo '#!/bin/sh
export USER=debian-kde
export HOME=/home/debian-kde
vncserver -name remote-desktop -localhost no :0
echo 'VNC server address: 127.0.0.1:5900 Password: 1234567890'' >> /usr/local/bin/startvnc

# Create script for stopping VNC server
echo '#!/bin/sh
export USER=debian-kde
export HOME=/home/debian-kde
vncserver -kill :0
rm -rf /home/debian-kde/.vnc/localhost:0.pid
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
chmod +x /home/debian-kde/.vnc/xstartup



