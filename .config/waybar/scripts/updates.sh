#!/usr/bin/env bash

PKG_UPDATE_MIN=50

is_pacman_running() {
    pgrep "paru|yay" >/dev/null 2>&1
    test $? -eq 0
}

show_updates() {
    pacman=$(checkupdates 2>/dev/null | wc -l)
    aur=$(yay -Qum 2>/dev/null | wc -l)
    updates=$(( pacman + aur ))

    [ $updates -ge $PKG_UPDATE_MIN ] && echo "󰏗 $updates" || echo ""
}

is_pacman_running && echo ""
show_updates
