#!/bin/sh
# Add apps to desktop
mkdir -p /home/ubuntu-xfce/Desktop
ln -s /usr/share/applications/office-online.desktop /home/ubuntu-xfce/Desktop/office-online.desktop
ln -s /usr/share/applications/firefox.desktop /home/ubuntu-xfce/Desktop/firefox.desktop
ln -s /usr/share/applications/chromium.desktop /home/ubuntu-xfce/Desktop/chromium.desktop
ln -s /usr/share/applications/vlc.desktop /home/ubuntu-xfce/Desktop/vlc.desktop
ln -s /usr/share/applications/thunderbird.desktop /home/ubuntu-xfce/Desktop/thunderbird.desktop
ln -s /usr/share/applications/org.gnome.Evince.desktop /home/ubuntu-xfce/Desktop/org.gnome.Evince.desktop
ln -s /usr/share/applications/galculator.desktop /home/ubuntu-xfce/Desktop/galculator.desktop
ln -s /usr/share/applications/org.xfce.ristretto.desktop /home/ubuntu-xfce/Desktop/org.xfce.ristretto.desktop
ln -s /usr/share/applications/xarchiver.desktop /home/ubuntu-xfce/Desktop/xarchiver.desktop
ln -s /usr/share/applications/org.xfce.mousepad.desktop /home/ubuntu-xfce/Desktop/org.xfce.mousepad.desktop
ln -s /usr/share/applications/xfce4-terminal.desktop /home/ubuntu-xfce/Desktop/xfce4-terminal.desktop
chmod -R 775 /home/ubuntu-xfce/Desktop/
chmod +x /home/ubuntu-xfce/Desktop/*.desktop
