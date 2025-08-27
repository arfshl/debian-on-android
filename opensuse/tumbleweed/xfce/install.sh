#!/bin/sh

# Install Desktop, VNC, and basic utility
zypper -n in -t pattern xfce
zypper -n in dbus-1 xdg-user-dirs xdg-user-dirs-gtk dbus-1-daemon pulseaudio xfce4-*-plugin pavucontrol elementary-xfce-icon-theme tigervnc wget nano curl sudo xfce4-terminal

# Adding user and password
sudo useradd -m opensuse-tumbleweed-xfce && echo 'opensuse-tumbleweed-xfce:123' | chpasswd && echo 'opensuse-tumbleweed-xfce ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user


# Setup VNC server
# Create VNC configuration directory
mkdir -p /home/opensuse-tumbleweed-xfce/.vnc

# Create VNC password file (default 1234567890)
printf "1234567890" | vncpasswd -f > /home/opensuse-tumbleweed-xfce/.vnc/passwd
chmod 600 /home/opensuse-tumbleweed-xfce/.vnc/passwd

# Create VNC startup script
echo '#!/bin/sh
xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:0
dbus-launch --exit-with-session startxfce4' >> /home/opensuse-tumbleweed-xfce/.vnc/xstartup

# Create script for starting VNC server
echo "#!/bin/sh
export USER=opensuse-tumbleweed-xfce
export HOME=/home/opensuse-tumbleweed-xfce
vncserver -name remote-desktop -localhost no :0
echo 'VNC server address: 127.0.0.1:5900 Password: 1234567890'" >> /usr/local/bin/startvnc

# Create script for stopping VNC server
echo '#!/bin/sh
export USER=opensuse-tumbleweed-xfce
export HOME=/home/opensuse-tumbleweed-xfce
vncserver -kill :0
rm -rf /home/opensuse-tumbleweed-xfce/.vnc/localhost:0.pid
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
chmod +x /home/opensuse-tumbleweed-xfce/.vnc/xstartup
