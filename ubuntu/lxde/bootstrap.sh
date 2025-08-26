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
proot-distro login ubuntu-lxde --user ubuntu-lxde' >> /data/data/com.termux/files/usr/bin/startubuntu-xfce

# for X11 session
cat <<EOF > /data/data/com.termux/files/usr/bin/startubuntu-lxde-x11
#!/bin/sh
LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
export XDG_RUNTIME_DIR=${TMPDIR}
kill -9 \$(pgrep -f "termux.x11")\ 2>/dev/null
kill -9 \$(pgrep -f "virgl")\ 2>/dev/null
proot-distro login ubuntu-lxde --shared-tmp -- /bin/sh -c 'kill -9 $(pgrep -f "x11") 2>/dev/null'
virgl_test_server_android &
termux-x11 :0 >/dev/null &
sleep 3
proot-distro login ubuntu-lxde --shared-tmp -- /bin/sh -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - ubuntu-lxde -c "DISPLAY=:0 GALLIUM_DRIVER=virpipe dbus-launch --exit-with-session startlxde"'
EOF

# Make all of them executable
chmod +x /data/data/com.termux/files/usr/bin/startubuntu-lxde*

# Install ubuntu under aliases
proot-distro install ubuntu --override-alias ubuntu-lxde

# Setup ubuntu-lxde
proot-distro login ubuntu-lxde -- /bin/sh -c 'wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/ubuntu/lxde/install.sh -O install.sh && chmod +x install.sh && ./install.sh && rm install.sh'
