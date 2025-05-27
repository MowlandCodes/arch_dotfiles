#!/bin/bash

FAIL="\x1b[31;1m"
SUCCESS="\x1b[32;1m"
INFO="\x1b[36;1m"
NORMAL="\x1b[0m"

# Checking for yay binaries
if [[ -z "$(command -v yay)" ]]; then
    echo -e "$INFO[*]$NORMAL Installing$INFO Yay$NORMAL..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo -e "$SUCCESS[*]$NORMAL Yay installed successfully!"
else
    echo -e "$SUCCESS[*]$NORMAL Yay already installed..."
fi
