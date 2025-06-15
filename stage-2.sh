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
