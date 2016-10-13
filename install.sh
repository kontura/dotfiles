#!/usr/bin/env bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfv "$DOTFILES_DIR/.xinitrc" ~
ln -sfv "$DOTFILES_DIR/.Xresources" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/sxhkdrc" ~/.config/sxhkd/sxhkdrc
