# Install Desktop, VNC, and basic utility
crb enable
dnf install epel-release -y
dnf install @Xfce @base-x xfce4* wget curl sudo nano


# Adding user and password
useradd -m el-xfce && echo 'el-xfce:123' | chpasswd && echo 'el-xfce ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user

# Setup VNC server
# Create VNC configuration directory
mkdir -p /home/el-xfce/.vnc

# Create VNC password file (default 1234567890)
printf "1234567890" | vncpasswd -f > /home/el-xfce/.vnc/passwd
chmod 600 /home/el-xfce/.vnc/passwd

# Create VNC startup script
echo '#!/bin/sh
xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:0
dbus-launch --exit-with-session startxfce4' >> /home/el-xfce/.vnc/xstartup

# Create script for starting VNC server
echo "#!/bin/sh
export USER=el-xfce
export HOME=/home/el-xfce
vncserver -name remote-desktop -localhost no :0
echo 'VNC server address: 127.0.0.1:5900 Password: 1234567890'" >> /usr/local/bin/startvnc

# Create script for stopping VNC server
echo '#!/bin/sh
export USER=el-xfce
export HOME=/home/el-xfce
vncserver -kill :0
rm -rf /home/el-xfce/.vnc/localhost:0.pid
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
chmod +x /home/el-xfce/.vnc/xstartup
