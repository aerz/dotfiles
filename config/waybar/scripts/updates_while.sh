#!/usr/bin/env bash
#
# Package updates indicator module script.
#
# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------
# paru (opt) (https://github.com/Morganamilo/paru/)
# yay  (opt) (https://github.com/Jguer/yay)
# pacman-contrib
# ------------------------------------------------------------------------------
# Config
# ------------------------------------------------------------------------------
# AUR helper to use installed on the system (empty means no helper)
AUR_HELPER="yay"

# Regex expression to list package managers installed on the system to ask for updates
REGEX_MGRS="paru|pacman|yay"

# Time in seconds to ask for available packages
TIME_TO_WAIT=5400

# Check package manager state every X seconds
TIME_CHECK_MGR=5400

# Minimum number of packages to show in the bar
PKGS_MIN=0

# ------------------------------------------------------------------------------

is_pkgmngr_running() {
    pgrep "$REGEX_MGRS" &>/dev/null
    test $? -eq 0
}

display_downloading() {
    while is_pkgmngr_running; do
        echo "󰏖 "
        sleep 1
    done
}

display_available_updates() {
    local arch aur updates
    arch=$(checkupdates 2>/dev/null | wc -l)
    aur=$($AUR_HELPER -Qum 2>/dev/null | wc -l)
    updates=$((arch + aur))

    [ $updates -ge $PKGS_MIN ] && echo "󰏗 $updates" || echo ""
}

sleep_refresh() {
    local times=0
    local total_times=$((TIME_TO_WAIT / TIME_CHECK_MGR))

    while ! is_pkgmngr_running && [ $times -ne $total_times ]; do
        sleep $TIME_CHECK_MGR && ((times++))
    done
}

while true; do
    is_pkgmngr_running && display_downloading
    display_available_updates
    sleep_refresh
done
