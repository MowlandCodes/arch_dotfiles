#!/bin/bash

function get_volume {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

function get_icon {
    current_vol=$(get_volume)
    is_mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "MUTED")

    if [[ -n "$is_mute" ]]; then
        echo "audio-volume-muted"
    elif [[ "$current_vol" -eq 0 ]]; then
        echo "audio-volume-muted"
    elif [[ "$current_vol" -lt 30 ]]; then
        echo "audio-volume-low"
    elif [[ "$current_vol" -lt 70 ]]; then
        echo "audio-volume-medium"
    else
        echo "audio-volume-high"
    fi
}

if [[ "$1" == "up" ]]; then
    wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
elif [[ "$1" == "down" ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
elif [[ "$1" == "mute" ]]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi

VOL=$(get_volume)
ICON=$(get_icon)

notify-send -h int:value:"$VOL" -h string:x-canonical-private-synchronous:sys-notify -u low -i "$ICON" "Volume: ${VOL}%" -t 1000
