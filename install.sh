#!/bin/bash

# Creates a batch of symlinks.
# Kinda crude, but I like it more than using the weird tools for it.

# Bash
ln -s ~/Dotfiles/Bash/bashrc ~/.bashrc

# Fish
ln -s ~/Dotfiles/Fish ~/.config/fish

# Wal
ln -s ~/Dotfiles/Wal ~/.config/wal

# Emacs
ln -s ~/Dotfiles/Emacs ~/.emacs.d

# Rofi
ln -s ~/Dotfiles/Rofi ~/.config/rofi

# XMonad
ln -s ~/Dotfiles/Xmonad ~/.xmonad

# Taffybar
ln -s ~/Dotfiles/Taffybar ~/.config/taffybar

# GTK2
ln -s ~/Dotfiles/GTK2/gtkrc-2.0 ~/.gtkrc-2.0

# GTK3
ln -s ~/Dotfiles/GTK3 ~/.config/gtk-3.0
