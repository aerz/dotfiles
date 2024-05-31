#!/usr/bin/env bash

if [[ "$(systemctl --user is-active darkman.service)" == "active" ]]; then
    SD_DARKMAN_MODE="$(systemctl --user show-environment | grep DARKMAN_MODE | cut -d = -f 2)"
    DARKMAN_MODE="$(darkman get)"

    if [[ "$SD_DARKMAN_MODE" != "$DARKMAN_MODE" ]]; then
        systemctl --user set-environment DARKMAN_MODE="$DARKMAN_MODE"
        systemctl --user restart swaybg.service
    fi
fi
