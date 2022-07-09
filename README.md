# debianonandroid
Run Debian/Ubuntu XFCE without root on Android with Termux
## Install Ubuntu/Debian
- Install Ubuntu

      $ pkg update && pkg install proot-distro wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/ubuntu -P /data/data/com.termux/files/usr/bin && chmod +x /data/data/com.termux/files/usr/bin/ubuntu && proot-distro install ubuntu && ubuntu

- Install Debian

      $ pkg update && pkg install proot-distro wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/debian -P /data/data/com.termux/files/usr/bin && chmod +x /data/data/com.termux/files/usr/bin/debian && proot-distro install debian && debian

## Install XFCE Desktop

      # apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/desktop.sh && sh desktop.sh && rm desktop.sh
