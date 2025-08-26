#!/bin/sh
# Install x11 and tur repo
termux-setup-storage
apt update
apt install x11-repo tur-repo
apt update

# Update installed package but keep configuration
apt upgrade -y -o Dpkg::Options::="--force-confold"

# Install depedency
apt install curl wget nano proot-distro termux-x11 pulseaudio vulkan-loader-android mesa-zink virglrenderer-mesa-zink virglrenderer-android -y

# for CLI session
echo '#!/bin/sh
LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
proot-distro login debian-kde --user debian-kde' >> /data/data/com.termux/files/usr/bin/debian-kde

# for X11 session
cat <<EOF > /data/data/com.termux/files/usr/bin/debian-kde-x11
#!/bin/sh
LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
export XDG_RUNTIME_DIR=${TMPDIR}
kill -9 \$(pgrep -f "termux.x11")\ 2>/dev/null
proot-distro login debian-kde --shared-tmp -- /bin/sh -c 'kill -9 $(pgrep -f "x11") 2>/dev/null'
termux-x11 :0 >/dev/null &
sleep 3
proot-distro login debian-kde --shared-tmp -- /bin/sh -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - debian-kde -c "DISPLAY=:0 XDG_SESSION_TYPE=x11 dbus-launch --exit-with-session startplasma-x11"'
EOF

# Make all of them executable
chmod +x /data/data/com.termux/files/usr/bin/debian-kde*

# Install debian under aliases
proot-distro install debian --override-alias debian-kde

# Setup debian-kde
proot-distro login debian-kde -- /bin/sh -c 'wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/kde/install.sh -O install.sh && chmod +x install.sh && ./install.sh && rm install.sh'

echo 'To start command line session: debian-kde'
echo 'To start X11 session: debian-kde-x11'
echo 'To start VNC server: startvnc'
echo 'To stop VNC server: stopvnc'
echo 'To restart VNC server: restartvnc'
echo 'Default user: debian-kde'
echo 'Default password: 123'    
echo 'VNC server address: 127.0.0.1:5900'
echo 'Default VNC password: 1234567890'