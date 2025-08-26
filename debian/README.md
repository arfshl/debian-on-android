# Debian Stable 

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
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/xfce/remove-full.sh && sh remove-full.sh && rm remove-full.sh    

## LXQt
- proot-distro aliases: debian-lxqt
- Username: debian-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/lxqt/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird lximage-qt kcalc lxqt-archiver qpdfview libheif1 webp-pixbuf-loader fonts-liberation p7zip featherpad -y && apt clean

#### Remove (rootfs only)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/lxqt/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (full)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/lxqt/remove-full.sh && sh remove-full.sh && rm remove-full.sh

## MATE
- proot-distro aliases: debian-mate
- Username: debian-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/mate/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird engrampa atril eom mate-calc pluma libheif1 webp-pixbuf-loader fonts-liberation p7zip -y && apt clean

#### Remove (rootfs only)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/mate/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (rootfs only)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/mate/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
    
## LXDE 
- proot-distro aliases: debian-lxde
- Username: debian-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/lxde/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird xarchiver atril mousepad galculator gpicview libheif1 webp-pixbuf-loader fonts-liberation p7zip -y && apt clean

#### Remove (rootfs only)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/lxde/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (full)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/lxde/remove-full.sh && sh remove-full.sh && rm remove-full.sh

## Cinnamon (Heavy)
- proot-distro aliases: debian-cinnamon
- Username: debian-cinnamon
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/cinnamon/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird engrampa evince eog mate-calc pluma libheif1 webp-pixbuf-loader fonts-liberation p7zip -y && apt clean


#### Remove (rootfs only)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/cinnamon/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (full)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/cinnamon/remove-full.sh && sh remove-full.sh && rm remove-full.sh

## KDE Plasma (Heavy)
- proot-distro aliases: debian-kde
- Username: debian-kde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/kde/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird okular gwenview kcalc ark kate libheif1 webp-pixbuf-loader fonts-liberation p7zip -y && apt clean


#### Remove (rootfs only)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/kde/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (full)
    wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/kde/remove-full.sh && sh remove-full.sh && rm remove-full.sh

## Installing Chromium
    sudo su && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/chromium-install.sh && sh chromium-install.sh && rm chromium-install.sh
