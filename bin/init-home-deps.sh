#!/bin/bash

sudo pacman -Syy git stack tmux gvim nodejs-lts-carbon kitty

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  mkdir -p ~/.vim/autoload/
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi 

git clone https://github.com/Tarrasch/antigen-hs.git ~/.config/zsh/antigen-hs/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/lcpz/lain ~/.config/awesome/lain
git clone https://github.com/lcpz/awesome-freedesktop ~/.config/awesome/freedesktop

# Install AUR Helper
if [[ ! -x /usr/bin/powerpill ]]; then
  git clone https://aur.archlinux.org/powerpill.git /tmp/powerpill
  cd /tmp/powerpill
  makepkg -si
fi

if [[ ! -x /usr/bin/yay ]]; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si
fi

# Init Antigen
cd ~/.config/zsh/antigen-hs
stack setup
source ~/.zshrc
antigen-hs-setup

# Install AUR Packages
yay -S nvm ttf-iosevka-termlig-custom-git

# Install Yarn Packages
yarn global add prettier
