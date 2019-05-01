#!/bin/bash
mkdir -p ~/.config/nvim ~/.config/sway ~/.config/fish
curdir=$(pwd)
ln -s $curdir/nvimrc ~/.config/nvim/init.vim
ln -s $curdir/i3config ~/.config/sway/config
ln -s $curdir/config.fish ~/.config/fish/config.fish
ln -s $curdir/Xresources ~/.config/Xresources
