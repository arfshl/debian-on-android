# Rocky Linux

## XFCE
- proot-distro aliases: rocky-xfce
- Username: el-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/xfce/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo dnf install -y firefox firefox-x11 vlc thunderbird atril ristretto mate-calc libheif xarchiver webp-pixbuf-loader p7zip mousepad 

#### Remove (rootfs only)
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/xfce/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (full)
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/xfce/remove-full.sh && sh remove-full.sh && rm remove-full.sh    


## MATE
- proot-distro aliases: rocky-mate
- Username: el-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/mate/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo dnf install -y firefox firefox-x11 vlc thunderbird atril eom mate-calc libheif engrampa webp-pixbuf-loader p7zip pluma

#### Remove (rootfs only)
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/mate/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (rootfs only)
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/mate/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
    

## KDE Plasma (Heavy)
- proot-distro aliases: rocky-kde
- Username: el-kde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/kde/bootstrap.sh && sh bootstrap.sh && rm bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo dnf install -y firefox firefox-x11 vlc thunderbird libheif webp-pixbuf-loader p7zip okular gwenview kcalc ark kate
#### Remove (rootfs only)
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/kde/remove-rootfs.sh && sh remove-rootfs.sh && rm remove-rootfs.sh
#### Remove (full)
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/el/rocky/kde/remove-full.sh && sh remove-full.sh && rm remove-full.sh

## Installing Chromium
    sudo su && wget https://github.com/arfshl/proot-distro-desktop/raw/refs/heads/main/el/install-chromium.sh && sh install-chromium.sh && rm install-chromium.sh
