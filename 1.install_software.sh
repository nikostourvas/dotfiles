#!/bin/bash

sudo apt update
sudo add-apt-repository -y ppa:kgilmer/speed-ricer

sudo apt install -y compton \
	i3-gaps i3-gaps-wm-dbg \
	polybar \
	redshift-gtk \
	nm-tray \
	rofi \
	pavucontrol \
	caja \
	lxappearance \
	lm-sensors hddtemp \
	p7zip p7zip-full p7zip-rar \
	arandr \
	qt5ct \
	qbittorrent \
	zathura \
	vlc \
	pdfarranger \
	vim \
	gimp \
	virtualbox \
	audacity 

# Detect laptop sensors
# Run manualy
# sudo sensors-detect

# Install Siji font
git clone https://github.com/stark/siji && cd siji
./install.sh

# Install Nextwaita
git clone https://github.com/paullinuxthemer/Nextwaita && cd Nextwaita
cp -r . ~/.themes
# open manualy lxappearance and set the theme and font size (Sans 7)

# Setting for Siji font on Ubuntu and Debian systems
sudo dpkg-reconfigure fontconfig-config
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf && fc-cache
