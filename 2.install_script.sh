#!/bin/bash

ln -sv ~/dotfiles/.vimrc ~
ln -sv ~/dotfiles/zathurarc ~/.config/zathura/zathurarc
ln -sv ~/dotfiles/redshift.conf ~/.config/
mkdir ~/.config/polybar
ln -sv ~/dotfiles/polybar/config ~/.config/polybar/
ln -sv ~/dotfiles/polybar/launch.sh ~/.config/polybar/
mkdir ~/.config/i3
ln -sv ~/dotfiles/i3/config ~/.config/i3/
ln -sv ~/dotfiles/compton/compton.conf ~/.config/compton.conf
ln -sv ~/dotfiles/.Xresources ~/.Xresources
ln -sv ~/dotfiles/.xbindkeysrc ~.xbindkeysrc
