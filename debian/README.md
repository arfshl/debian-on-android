# Debian

## XFCE
- proot-distro aliases: debian-xfce
- Username: debian-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/xfce/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird atril ristretto galculator libheif1 xarchiver webp-pixbuf-loader fonts-liberation p7zip mousepad -y && apt clean

#### Remove (rootfs only)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/xfce/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (full)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/xfce/remove-full.sh && sh remove-full.sh && rm remove-full.sh    # debian LTS 

