#!/bin/sh
proot-distro remove rocky-xfce

rm /data/data/com.termux/files/usr/bin/rocky-xfce
rm /data/data/com.termux/files/usr/bin/rocky-xfce-x11

apt remove proot-distro termux-x11 pulseaudio vulkan-loader-android mesa-zink virglrenderer-mesa-zink virglrenderer-android -y && apt autoremove -y

apt remove x11-repo tur-repo -y && apt update
