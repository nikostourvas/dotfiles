#!/bin/bash

sudo add-apt-repository -y ppa:kgilmer/speed-ricer
sudo apt update && sudo apt -y upgrade

sudo apt install -y compton \
	i3-gaps i3-gaps-wm-dbg \
	redshift-gtk \
	nm-tray \
	blueman \
	rofi \
	pavucontrol \
	caja caja-dropbox \
	lxappearance \
	lm-sensors hddtemp \
	p7zip p7zip-full p7zip-rar \
	arandr \
	qt5ct \
	qt5-style-plugins \
	qbittorrent \
	zathura \
	vlc \
	pdfarranger \
	vim \
	gimp \
	virtualbox \
	audacity \
	automake \
	autoconf \
	feh \
	s-tui \
	fonts-noto \
	mlocate \
	scrot \
	pandoc pandoc-citeproc \
	nitrogen \
	pdfgrep \
	grsync \
	luckybackup \
	tldr \
	autorandr \
	tilix \
	minder
	
# Install snap packages
sudo snap install p7zip-desktop
sudo snap install keepassxc

# Detect laptop sensors
# Run manualy the following:
# sudo sensors-detect

# Install Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Siji font
cd ~/Downloads 
git clone https://github.com/stark/siji && cd siji
./install.sh

# Install polybar
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
git clone --recursive https://github.com/polybar/polybar
cd polybar

mkdir build
cd build
cmake ..
make -j$(nproc)
	# Optional. This will install the polybar executable in /usr/local/bin
sudo make install

# Install Nextwaita
#git clone https://github.com/paullinuxthemer/Nextwaita && cd Nextwaita
#mkdir ~/.themes
#cp -r . ~/.themes
# open manualy lxappearance and set the theme and font size (Sans 7)

# Install Nordic gtk theme
#git clone https://github.com/EliverLara/Nordic 
#mkdir ~/.themes 
#cp -r Nordic ~/.themes/Nordic

#cp -r . ~/.themes

# Setting for Siji font on Ubuntu and Debian systems
sudo dpkg-reconfigure fontconfig-config
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf && fc-cache

# Install light (program to configure backlight and more)
cd ~/Downloads
git clone https://github.com/haikarainen/light.git
cd light*
./autogen.sh
./configure && make
sudo make install
cd # retrun to home directory

# Fix xbacklight, required to get icon in polybar
sudo touch /usr/share/X11/xorg.conf.d/20-intel.conf
sudo echo "Section "Device"
         Identifier  "card0"
         Driver      "intel"
         Option      "Backlight"  "intel_backlight"
         BusID       "PCI:0:2:0"
EndSection" >> /usr/share/X11/xorg.conf.d/20-intel.conf

# Fix screen tearing
sudo touch /etc/X11/xorg.conf.d/20-intel.conf
sudo echo "Section "Device"
   Identifier  "Intel Graphics"
   Driver      "i915"
   Option      "TearFree"    "true"
   Option      "DRI"         "3"
EndSection" >> /etc/X11/xorg.conf.d/20-intel.conf

# Vim keybindgs in bash
echo "set -o vi" >> .bashrc

# Fix Calibri font rendering on Linux
# To have Calibri available, you need to install it from a Windows partition
mkdir ~/.config/fontconfig && cd ~/.config/fontconfig
touch fonts.conf
echo "<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <test name="family" compare="contains">
      <string>Calibri</string>
    </test>
    <edit name="embeddedbitmap" mode="assign">
      <bool>false</bool>
    </edit>
  </match>
</fontconfig>" >> ~/.config/fontconfig/fonts.conf

# Install timeshift
sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt update
sudo apt -y install timeshift

# Install obs
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt-get update
sudo apt-get install -y obs-studio

# Install tlp
sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt update
sudo apt install -y tlp tlp-rdw
