#!/bin/bash

sudo apt update
sudo add-apt-repository -y ppa:kgilmer/speed-ricer

sudo apt install -y compton i3-gaps i3-gaps-wm-dbg polybar redshift-gtk nm-tray rofi pavucontrol

sudo dpkg-reconfigure fontconfig-config
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf && fc-cache
