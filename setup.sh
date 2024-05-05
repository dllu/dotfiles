#!/bin/bash
mkdir -p ~/.config/nvim \
    ~/.config/i3 \
    ~/.config/sway \
    ~/.config/fish \
    ~/.config/fontconfig \
    ~/.config/alacritty \
    ~/.config/rofi \
    ~/.config/neofetch
curdir=$(pwd)

ln -s $curdir/init.lua ~/.config/nvim/init.lua
ln -s $curdir/i3config ~/.config/i3/config
ln -s $curdir/swayconfig ~/.config/sway/config
ln -s $curdir/config.fish ~/.config/fish/config.fish
ln -s $curdir/Xresources ~/.config/Xresources
ln -s $curdir/fonts.conf ~/.config/fontconfig/fonts.conf
ln -s $curdir/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s $curdir/rofi.rasi ~/.config/rofi/dllu.rasi
ln -s $curdir/neofetch.conf ~/.config/neofetch/config.conf
ln -s $curdir/pup.txt ~/.config/neofetch/pup.txt
ln -s $curdir/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s $curdir/rtorrent.rc ~/.rtorrent.rc

mv ~/.bashrc ~/.bashrc_backup
ln -s $curdir/bashrc ~/.bashrc

wget -O $curdir/dircolors.256dark -N https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark
ln -s $curdir/dircolors.256dark ~/.config/.dircolors
