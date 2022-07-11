# debian-on-android
Script to install Debian/Ubuntu on Termux
## You Need
- [Termux](https://f-droid.org/packages/com.termux)
- [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)
## Install Ubuntu/Debian
- Install Ubuntu

      pkg update && pkg install proot-distro wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/ubuntu -P /data/data/com.termux/files/usr/bin && chmod +x /data/data/com.termux/files/usr/bin/ubuntu && proot-distro install ubuntu && ubuntu

- Install Debian

      pkg update && pkg install proot-distro wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/debian -P /data/data/com.termux/files/usr/bin && chmod +x /data/data/com.termux/files/usr/bin/debian && proot-distro install debian && debian

## Install Desktop Environment
**NOTE:Execute these command in PRoot shell (Shell you get after start Debian/Ubuntu), not Termux shell**
### XFCE

    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/xfce.sh && sh xfce.sh && rm xfce.sh

### MATE

    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/mate.sh && sh mate.sh && rm mate.sh

### LXQt

    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxqt.sh && sh lxqt.sh && rm lxqt.sh

### LXDE

    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxde.sh && sh lxde.sh && rm lxde.sh

### KDE 

    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/debian-on-android/main/kde.sh && sh kde.sh && rm kde.sh
