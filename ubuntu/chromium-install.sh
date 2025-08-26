#!/bin/sh
# Install Chromium ARM from Debian Repository
echo 'Adding Debian Repository...'
sudo wget -q http://ftp.us.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2023.3+deb12u2_all.deb
sudo dpkg -i debian-archive-keyring_2023.3+deb12u2_all.deb
sudo rm debian-archive-keyring_2023.3+deb12u2_all.deb
sudo echo 'deb https://deb.debian.org/debian/ bookworm contrib main non-free non-free-firmware
deb https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware' >> /etc/apt/sources.list.d/debian.list

echo 'Package: chromium
Pin: origin security.debian.org
Pin-Priority: 1000

Package: chromium-common
Pin: origin security.debian.org
Pin-Priority: 1000

Package: chromium-sandbox
Pin: origin security.debian.org
Pin-Priority: 1000

Package: chromium-browser
Pin: release o=Ubuntu
Pin-Priority: -1' >> /etc/apt/preferences.d/chromium

sudo apt update && sudo apt install chromium -y && apt clean
sudo sed -i 's|chromium --incognito %U|chromium --incognito --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium %U|chromium --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium --new-window %U|chromium --new-window --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo rm /etc/chromium/master_preferences
