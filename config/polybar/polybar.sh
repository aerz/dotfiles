#!/usr/bin/env bash

polybar-msg cmd quit
while pgrep -u $UID -x polybar > /dev/null; do sleep 5; done

case "$(hostname)" in
    minivac)
        polybar --reload --config="$HOME/.config/polybar/minivac.ini" laptop 2>&1 | \
            tee -a /tmp/polybar.laptop.log & disown
        ;;
esac
