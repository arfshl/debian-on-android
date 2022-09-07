#!/bin/sh
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
clear
echo 'To start Debian use debian command'
proot-distro login debian
