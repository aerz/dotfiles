#!/usr/bin/env bash

if command -v wpctl &>/dev/null; then
    echo "wireplumber is not available"
    exit 1
fi

action="$1"

case "$action" in
    next | previous)
        playerctl "$1" ||
            notify-send --expire-time=2000 'playerctl' "No player could handle $1 command"
        ;;
    stop | play-pause)
        playerctl "$1" ||
            notify-send --expire-time=2000 'playerctl' "No players found to $1"
        ;;
    increase)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2"%+ --limit 1
        ;;
    decrease)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2"%-
        ;;
    mute)
        if [[ "$2" == "--input" ]]; then
            wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        else
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        fi
        ;;
esac
