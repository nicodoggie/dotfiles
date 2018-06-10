#!/bin/bash

sudo pacman -Syy git stack tmux gvim node-lts-carbon

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  mkdir -p ~/.vim/autoload/
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi 

git clone https://github.com/Tarrasch/antigen-hs.git ~/.config/zsh/antigen-hs/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/lcpz/lain ~/.config/awesome/lain
git clone https://github.com/lcpz/awesome-freedesktop ~/.config/awesome/freedesktop

if [[ ! -x /usr/bin/yay ]]; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si
fi

yarn global add prettier
