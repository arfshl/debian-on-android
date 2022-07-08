# debianonandroid
Run Debian/Ubuntu XFCE without root on Android with Termux
## Install Ubuntu/Debian
- Install Ubuntu

      $ pkg update && pkg install proot-distro wget && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/ubuntu -P /data/data/com.termux/files/usr/bin && chmod +x ubuntu && proot-distro install ubuntu && ubuntu

- Install Debian

      $ pkg update && pkg install proot-distro wget && wget https://raw.githubusercontent.com/arfshl/debianonandroid/main/debian -P /data/data/com.termux/files/usr/bin && chmod +x debian && proot-distro install debian && debian
