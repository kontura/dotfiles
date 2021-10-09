#!/usr/bin/env bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config 
mkdir -p ~/.config/nvim

ln -sfv "$DOTFILES_DIR/.xinitrc" ~
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~

ln -sfv "$DOTFILES_DIR/.vimrc" ~/.config/nvim/init.vim
ln -sfv "$DOTFILES_DIR/.vim/bundle" ~/.config/nvim/bundle
ln -sfv "$DOTFILES_DIR/.vim/autoload" ~/.config/nvim/autoload

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

ln -sfv "$DOTFILES_DIR/alacritty" ~/.config/
