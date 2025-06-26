#!/bin/bash

### For output coloring ###
FAIL="\x1b[31;1m"
SUCCESS="\x1b[32;1m"
INFO="\x1b[36;1m"
NORMAL="\x1b[0m"
###########################

# Check if running in root
if [[ $(id -u) -ne 0 ]]; then
    echo -e "$FAIL[*]$NORMAL Please run as root!"
    exit 1
fi

# Running some services on startup
echo -e "$INFO[*]$NORMAL Enabling services on startup..."

systemctl enable ly.service # Enable Ly display manager
systemctl enable bluetooth.service # Enable Bluetooth
systemctl enable cups.service # Enable CUPS (for Printer Manager)

# Rebooting System
echo -e "$SUCCESS[*]$NORMAL Installation complete!...\n"

REPLY=''
read -p "$INFO[*]$NORMAL Reboot now? [Y/n] " -n 1 -r REPLY

if [[ "$REPLY" == 'y' ]] || [[ "$REPLY" == 'Y' ]]; then
    echo -e "$INFO[*]$NORMAL Rebooting system..."
    systemctl reboot
else
    exit 0
