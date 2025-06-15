#!/bin/bash

### For output coloring ###
FAIL="\x1b[31;1m"
SUCCESS="\x1b[32;1m"
INFO="\x1b[36;1m"
NORMAL="\x1b[0m"
###########################

# List of dotfiles to stow
DOTFILES=(bash dunst gtk nvim picom ranger rofi starship statusbar suckless wallpaper zathura)

# Install starship for prompt decoration
if [[ "$(command -v curl)" ]]; then
    curl -sS https://starship.rs/install.sh | sh
else
    echo -e "$FAIL[-]$NORMAL Curl not found! Installing curl..."
    yay -Sy curl # Ensure yay is already installed.
fi

# Installing all packages
echo -e "$INFO[*]$NORMAL Installing all necessary packages..."
echo -e "$INFO[*]$NORMAL This might take a while..."
yay -Sy --needed "${PACKAGES[@]}"

# Stowing all dotfiles
echo -e "$INFO[*]$NORMAL Stowing all dotfiles...\n"
for dotfile in "${DOTFILES[@]}"; do
    echo -e "$INFO[*]$NORMAL Stowing $INFO$dotfile$NORMAL..."
    stow --adopt -R --target="$HOME" "$dotfile"
    if [[ "$dotfile" == "suckless" ]]; then
        # Compile dwm
        cd $HOME/suckless/dwm  
        rm patches.h config.h # Ensure it's a clean install
        echo -e "$INFO[*]$NORMAL Installing$INFO dwm$NORMAL..."
        make clean install
        echo -e "$SUCCESS[*]$NORMAL Installed$INFO dwm$NORMAL..."

        # Compile dwmblocks
        cd $HOME/suckless/dwmblocks
        echo -e "$INFO[*]$NORMAL Installing$INFO dwmblocks$NORMAL..."
        make clean install
        echo -e "$SUCCESS[*]$NORMAL Installed$INFO dwmblocks$NORMAL..."

        # Compile st
        cd $HOME/suckless/st
        rm config.h # Ensure it's a clean install
        echo -e "$INFO[*]$NORMAL Installing$INFO st$NORMAL..."
        make clean install
        echo -e "$SUCCESS[*]$NORMAL Installed$INFO st$NORMAL..."
    elif [[ "$dotfile" == "wallpaper" ]]; then
        # Copy the wallpaper into /usr/share/wallpapers/
        mkdir -p /usr/share/wallpapers
        cp $HOME/wallpaper.gif /usr/share/wallpapers/
    fi
done

# Running some services on startup
echo -e "$INFO[*]$NORMAL Enabling services on startup..."

systemctl enable lightdm.service # Enable Lightdm
adduser "$(whoami)" lightdm # Adding current user to Lightdm User Group

systemctl enable bluetooth.service # Enable Bluetooth

# Installing nwg-look
echo -e "$INFO[*]$NORMAL Installing nwg-look..."
git clone https://github.com/nwg-piotr/nwg-look.git $HOME/nwg-look
cd $HOME/nwg-look
make build install
cd $HOME
rm -rf $HOME/nwg-look

# Installing Catppuccin GTK Theme
yay -Sy --needed catppuccin-gtk-theme-macchiato

# Configuring LightDM for GTK Greeter
cp ./lightdm/lightdm.conf /etc/lightdm/
cp ./lightdm/lightdm-gtk-greeter.conf /etc/lightdm/

# Rebooting System
echo -e "$SUCCESS[*]$NORMAL Installation complete! Rebooting system..."
sleep 3
systemctl reboot
