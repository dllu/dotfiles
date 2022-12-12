#!/bin/bash
mkdir -p ~/.config/nvim ~/.config/sway ~/.config/fish ~/.config/fontconfig
curdir=$(pwd)
ln -s $curdir/init.lua ~/.config/nvim/init.lua
ln -s $curdir/i3config ~/.config/i3/config
ln -s $curdir/swayconfig ~/.config/sway/config
ln -s $curdir/config.fish ~/.config/fish/config.fish
ln -s $curdir/Xresources ~/.config/Xresources
ln -s $curdir/fonts.conf ~/.config/fontconfig/fonts.conf
ln -s $curdir/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $curdir/rofi.rasi ~/.config/rofi/dllu.rasi
ln -s $curdir/neofetch.conf ~/.config/neofetch/config.conf
ln -s $curdir/pup.txt ~/.config/neofetch/pup.txt
