#!/bin/sh
# Install Apps
apt update && apt install chromium firefox vlc thunderbird xarchiver atril mousepad galculator gpicview libheif1 webp-pixbuf-loader fonts-liberation p7zip -y && apt clean
sudo sed -i 's|chromium --incognito %U|chromium --incognito --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium %U|chromium --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium --new-window %U|chromium --new-window --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo rm /etc/chromium/master_preferences
wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/scripts/office-online.desktop -P /usr/share/applications/