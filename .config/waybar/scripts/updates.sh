#!/usr/bin/env bash
#
# Package updates indicator module script.
#
# ------------------------------------------------------------------------------
# DEPENDENCIES
# ------------------------------------------------------------------------------
# paru (https://github.com/Morganamilo/paru/)
# pacman-contrib

is_pkgmgr_running() {
    pgrep "paru|pacman" &>/dev/null
    test $? -eq 0
}

if is_pkgmgr_running; then
    echo ""
    sleep 600 # 10m
fi

while true; do
    pacman=$(checkupdates 2>/dev/null | wc -l)
    aur=$(/usr/bin/paru -Qum 2>/dev/null | wc -l)
    updates=$(( pacman + aur ))

    [ $updates -ge 0 ] && echo "󰏗 $updates" || echo ""
    sleep 21600 # 6h
done
