#!/bin/bash

### For output coloring ###
FAIL="\x1b[31;1m"
SUCCESS="\x1b[32;1m"
INFO="\x1b[36;1m"
NORMAL="\x1b[0m"
###########################

# Checking for yay binaries
if [[ -z "$(command -v yay)" ]]; then
    echo -e "$INFO[*]$NORMAL Installing$INFO Yay$NORMAL..."
    pacman -Sy --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo -e "$SUCCESS[*]$NORMAL Yay installed successfully!"
else
    echo -e "$SUCCESS[*]$NORMAL Yay already installed..."
fi

# List of packages to install
PACKAGES=(base-devel xorg xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk bluez bluez-utils blueman pulseaudio pulseaudio-alsa pulseaudio-bluetooth zen-browser-bin picom neovim fastfetch net-tools wireless_tools curl wget zathura ranger rofi dunst xgifwallpaper stow nodejs npm lua python prettierd ueberzugpp cmake make zoxide ttf-jetbrains-mono-nerd eza go gtk3 xcur2png jq )

