#!/bin/bash

sudo pacman -Syu --noconfirm -needed git

echo -e "\nCloning dotfiles from https://github.com/sudiplun/dotfiles.git"
rm -rf ~/.local/share/dotfiles/
git clone https://github.com/sudiplun/dotfiles ~/.local/share/dotfiles

echo -e "\nInstallation starting..."
source ~/.local/share/dotfiles/install.sh
