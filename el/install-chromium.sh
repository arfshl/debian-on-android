#!/bin/sh
sudo dnf install -y chromium
sudo sed -i 's|chromium --incognito %U|chromium --incognito --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium %U|chromium --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo sed -i 's|chromium --new-window %U|chromium --new-window --no-sandbox %U|' /usr/share/applications/chromium.desktop
sudo rm /etc/chromium/master_preferences
