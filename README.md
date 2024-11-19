# debian-on-android
Script to install Ubuntu/Debian on Termux
## You Need
- [Termux](https://github.com/termux/termux-app/releases/)
- [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android) (If you want to install desktop)
## Install Ubuntu/Debian
- Install Ubuntu

      apt update && apt dist-upgrade -y && apt install proot-distro -y && proot-distro install ubuntu

- Install Debian

      apt update && apt dist-upgrade -y && apt install proot-distro -y && proot-distro install debian

### PRoot Login command
- Ubuntu

      proot-distro login ubuntu

- Debian

      proot-distro login debian

### [OPTIONAL] PRoot Auto-Login
- Ubuntu

      echo 'proot-distro login ubuntu' >> $PREFIX/etc/bash.bashrc

- Debian

      echo 'proot-distro login debian' >> $PREFIX/etc/bash.bashrc

### Repository setup, update package, and set timezone

    apt update && apt dist-upgrade && dpkg-reconfigure tzdata

## Install Graphical Environment

### Fix for 'Dummy Output' on OneUI
     echo 'LD_PRELOAD=/system/lib64/libskcodec.so' >> $PREFIX/etc/bash.bashrc

### Set up Pulseaudio (Execute in Termux shell)

    apt install pulseaudio -y && echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> $PREFIX/etc/bash.bashrc

### Desktop Environment
- KDE 

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/kde.sh && sh kde.sh && rm kde.sh

- XFCE

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/xfce.sh && sh xfce.sh && rm xfce.sh

- MATE

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/mate.sh && sh mate.sh && rm mate.sh

- LXQt

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxqt.sh && sh lxqt.sh && rm lxqt.sh

- LXDE

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/lxde.sh && sh lxde.sh && rm lxde.sh

### Window Manager
- i3

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/i3.sh && sh i3.sh && rm i3.sh

- Openbox 

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/openbox.sh && sh openbox.sh && rm openbox.sh

- Awesome

      curl -O https://raw.githubusercontent.com/arfshl/debian-on-android/main/awesome.sh && sh awesome.sh && rm awesome.sh
  

### Add user other than root and set up sudo

    apt install sudo adduser && adduser [username] && echo '[username] ALL=(ALL:ALL) ALL' >> /etc/sudoers.d/user

### Login with username

    proot-distro login ubuntu --user [username]


### Install Mozilla Firefox (Official Repository - Firefox Nightly ARM64 Binary)

- Add Repository

      wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null && sudo echo "deb [arch=arm64 signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

- Repository Pinning

      echo '
      Package: *
      Pin: origin packages.mozilla.org
      Pin-Priority: 1000
      ' | sudo tee /etc/apt/preferences.d/mozilla 

- Install Firefox Nightly

      sudo apt update && sudo apt install firefox-nightly


- Hold snapd Packages

      sudo echo 'Package: snapd
      Pin: release a=*
      Pin-Priority: -10' >> /etc/apt/preferences.d/nosnap.pref
