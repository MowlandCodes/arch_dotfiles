#!/bin/bash

# Install additional 3rd Party Packages such as Flatpak

### For output coloring ###
FAIL="\x1b[31;1m"
SUCCESS="\x1b[32;1m"
INFO="\x1b[36;1m"
NORMAL="\x1b[0m"
###########################

# Install starship for prompt decoration
if [[ "$(command -v curl)" ]]; then
    curl -sS https://starship.rs/install.sh | sh
else
    echo -e "$FAIL[-]$NORMAL Curl not found! Installing curl..."
    yay -Sy curl # Ensure yay is already installed.
    curl -sS https://starship.rs/install.sh | sh
fi

# List of dotfiles to stow
DOTFILES=(bash dunst gtk nvim picom ranger rofi starship statusbar suckless tmux wallpaper zathura)

# Stowing all dotfiles
echo -e "$INFO[*]$NORMAL Stowing all dotfiles...\n"
for dotfile in "${DOTFILES[@]}"; do
    echo -e "$INFO[*]$NORMAL Configuring $INFO$dotfile$NORMAL..."
    if [[ "$dotfile" == "suckless" ]]; then
        stow --target="$HOME" "$dotfile"
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
        stow --target="$HOME" "$dotfile"
        mkdir -p /usr/share/wallpapers
        cp $HOME/wallpaper.gif /usr/share/wallpapers/
    else
        stow --target="$HOME" "$dotfile"
    fi
done

# Installing Catppuccin GTK Theme
echo -e "$INFO[*]$NORMAL Installing Catppuccin GTK Theme..."
yay -Sy --needed catppuccin-gtk-theme-macchiato

# Installing Flatpak Apps
echo -e "$INFO[*]$NORMAL Installing Flatpak Apps..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo # Add flatpakrepo if not exists

# Installing Apps
flatpak install flathub com.rtosta.zapzap # Whatsapp Client
flatpak install flathub com.valvesoftware.Steam # Steam Client
flatpak install flathub org.telegram.desktop # Telegram Desktop
