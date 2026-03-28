#!/bin/bash

INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)

if [ -z "$INTERFACE" ]; then
    echo '{"text": "Offline ⚠", "class": "disconnected"}'
    exit 0
fi

if [[ "$INTERFACE" == e* ]]; then
    echo -e "{\"text\": \"Ethernet 󰈀\", \"tooltip\": \"Connected via $INTERFACE\", \"class\": \"ethernet\"}"
    exit 0
fi

if [[ "$INTERFACE" == w* ]]; then
    DBM=$(iw dev "$INTERFACE" link | grep signal | awk '{print $2}')
    
    if [ -z "$DBM" ]; then
        echo '{"text": "No Signal ⚠", "class": "disconnected"}'
        exit 0
    fi

    if [ "$DBM" -ge -50 ]; then
        QUALITY=100
    elif [ "$DBM" -le -100 ]; then
        QUALITY=0
    else
        QUALITY=$(( 2 * (DBM + 100) ))
    fi

    echo -e "{\"text\": \" $QUALITY%\", \"tooltip\": \"Raw: $DBM dBm on $INTERFACE\", \"class\": \"wifi\"}"
    exit 0
fi

echo -e "{\"text\": \"Connected 󰖩\", \"tooltip\": \"Routing via $INTERFACE\", \"class\": \"unknown\"}"
