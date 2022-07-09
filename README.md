# debianonandroid
Run Debian/Ubuntu XFCE without root on Android with Termux
## You Need
- [Termux](https://f-droid.org/packages/com.termux)
- [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)
## Install Ubuntu/Debian
- Install Ubuntu

      pkg update && pkg install proot-distro wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/ubuntu -P /data/data/com.termux/files/usr/bin && chmod +x /data/data/com.termux/files/usr/bin/ubuntu && proot-distro install ubuntu && ubuntu

- Install Debian

      pkg update && pkg install proot-distro wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/debian -P /data/data/com.termux/files/usr/bin && chmod +x /data/data/com.termux/files/usr/bin/debian && proot-distro install debian && debian

## Install Desktop Environment
**NOTE:Execute this command in PRoot shell (Shell you get after start Debian/Ubuntu), not Termux shell**
### XFCE

      apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/desktop.sh && sh desktop.sh && rm desktop.sh
