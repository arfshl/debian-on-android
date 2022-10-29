# debian-on-android
Script to install Ubuntu/Debian on Termux
## You Need
- [Termux](https://f-droid.org/packages/com.termux)
- [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android) (If you want to install desktop)
## Install Ubuntu/Debian
- Install Ubuntu

      pkg update && pkg install proot-distro -y && proot-distro install ubuntu && proot-distro login ubuntu

- Install Debian

      pkg update && pkg install proot-distro -y && proot-distro install debian && proot-distro login debian

## Install Graphical Environment
### Set up Pulseaudio

      pkg install pulseaudio -y && echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> $PREFIX/etc/bash.bashrc

### Desktop Environment
**NOTE:Execute these command in PRoot shell (Shell you get after start Debian/Ubuntu), not Termux shell**
- KDE 

      apt update && apt upgrade && apt install curl -y && curl -o https://raw.githubusercontent.com/arfshl/debian-on-android/main/kde.sh && sh kde.sh && rm kde.sh

- XFCE

      apt update && apt upgrade && apt install curl -y && curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/xfce.sh && sh xfce.sh && rm xfce.sh

- MATE

      apt update && apt upgrade && apt install curl -y && curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/mate.sh && sh mate.sh && rm mate.sh

- LXQt

      apt update && apt upgrade && apt install curl -y && curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxqt.sh && sh lxqt.sh && rm lxqt.sh

- LXDE

      apt update && apt upgrade && apt install curl -y && curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxde.sh && sh lxde.sh && rm lxde.sh

### Window Manager
- i3

      apt update && apt upgrade && apt install curl -y && curl -o https://raw.githubusercontent.com/arfshl/debian-on-android/main/i3.sh && sh i3.sh && rm i3.sh

- Openbox 

      apt update && apt upgrade && apt install curl -y && curl -o https://raw.githubusercontent.com/arfshl/debian-on-android/main/openbox.sh && sh openbox.sh && rm openbox.sh

- Awesome

      apt update && apt upgrade && apt install curl -y && curl -o https://raw.githubusercontent.com/arfshl/debian-on-android/main/awesome.sh && sh awesome.sh && rm awesome.sh

## Start PRoot when open Termux immediately
- Ubuntu

      echo 'proot-distro login ubuntu' >> $PREFIX/etc/bash.bashrc

- Debian

      echo 'proot-distro login debian' >> $PREFIX/etc/bash.bashrc




