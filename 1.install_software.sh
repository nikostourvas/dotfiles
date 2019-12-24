#!/bin/bash

sudo apt update
sudo add-apt-repository -y ppa:kgilmer/speed-ricer

sudo apt install compton i3-gaps-wm polybar redshift-gtk nm-tray 

sudo dpkg-reconfigure fontconfig-config
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf && fc-cache
