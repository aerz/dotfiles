#!/usr/bin/env bash

playerctl --follow metadata --format '{{ title }} {{ status }}' | \
    while read -r status; do
        case "$status" in
            *Playing)
                txt="$(playerctl metadata --format '{{ title }} - {{ artist }}')"
                tooltip="$(playerctl metadata --format '{{ playerName }} is playing {{ title }} - {{ artist }}')"
                printf '{"text":"󰐍 %s","tooltip":"%s","class":"active"}\n' "$txt" "$tooltip"
                ;;
            *Paused)
                txt="$(playerctl metadata --format '{{ playerName }}')"
                printf '{"text":"󰏦 %s","tooltip":"Player is paused","class":""}\n' "$txt"
                ;;
            *)
                printf '{"text":"","tooltip":"","class":""}\n'
                ;;
        esac
    done
