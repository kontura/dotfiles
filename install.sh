#!/usr/bin/env bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config

ln -sfv "$DOTFILES_DIR/.xinitrc" ~
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~

ln -sfv "$DOTFILES_DIR/nvim" ~/.config/
curl -fLo "${DOTFILES_DIR}/nvim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
