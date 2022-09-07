#!/bin/sh
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
clear
echo 'To start Ubuntu use ubuntu command'
proot-distro login ubuntu
