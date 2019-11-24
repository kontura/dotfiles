#!/usr/bin/env bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config 

ln -sfv "$DOTFILES_DIR/.xinitrc" ~
ln -sfv "$DOTFILES_DIR/.Xresources" ~
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/sxhkd" ~/.config/
ln -sfv "$DOTFILES_DIR/tig" ~/.config/
ln -sfv "$DOTFILES_DIR/waybar" ~/.config/
ln -sfv "$DOTFILES_DIR/mako" ~/.config/
ln -sfv "$DOTFILES_DIR/.inputrc" ~
ln -sfv "$DOTFILES_DIR/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~

ln -sfv "$DOTFILES_DIR/wayfire.ini" ~/.config/
ln -sfv "$DOTFILES_DIR/wf-shell.ini" ~/.config/

mkdir -p ~/src
cd ~/src && git clone https://git.suckless.org/dwm
cd ~/src && git clone https://aur.archlinux.org/st-scrollback-git.git
ln -sfv "$DOTFILES_DIR/dwm/config.h" ~/src/dwm/config.h
