#!/bin/bash

# Install AUR Helpers
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

yay -Syy git stack tmux gvim nodejs-lts-carbon kitty nvm ttf-dejavu-sans-code

# Install plug
if [ ! -e ~/.vim/autoload/plug.vim ]; then
  mkdir -p ~/.vim/autoload/
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi 

git clone https://github.com/Tarrasch/antigen-hs.git ~/.config/zsh/antigen-hs/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/lcpz/lain ~/.config/awesome/lain
git clone https://github.com/lcpz/awesome-freedesktop ~/.config/awesome/freedesktop

# Init Antigen
cd ~/.config/zsh
stack init
source ~/.zshrc
antigen-hs-setup

# Install Yarn Packages
yarn global add prettier
