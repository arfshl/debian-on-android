#!/bin/sh

# Install Desktop, VNC, and basic utility
zypper -n in -t pattern kde
zypper -n in dbus-1 xdg-user-dirs dbus-1-daemon pulseaudio pavucontrol-qt tigervnc wget nano curl sudo konsole

# Generate dbus machine id
dbus-uuidgen --ensure

# Adding user and password
sudo useradd -m opensuse-kde && echo 'opensuse-kde:123' | chpasswd && echo 'opensuse-kde ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user


# Setup VNC server
# Create VNC configuration directory
mkdir -p /home/opensuse-kde/.vnc

# Create VNC password file (default 1234567890)
printf "1234567890" | vncpasswd -f > /home/opensuse-kde/.vnc/passwd
chmod 600 /home/opensuse-kde/.vnc/passwd

# Create script for starting VNC server
echo "#!/bin/sh
Xvnc -rfbauth ~/.vnc/passwd -localhost no :0 &
export DISPLAY=:0
export PULSE_SERVER=127.0.0.1
dbus-launch --exit-with-session startplasma-x11 &
echo 'VNC server address: 127.0.0.1:5900 Password: 1234567890'" >> /usr/local/bin/startvnc

# Create script for stopping VNC server
echo '#!/bin/sh
kill -9 $(pgrep -f "Xvnc") 2>/dev/null
kill -9 $(pgrep -f "plasma") 2>/dev/null
kill -9 $(pgrep -f "kde") 2>/dev/null
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
chmod +x /home/opensuse-kde/.vnc/xstartup
