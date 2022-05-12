#!/usr/bin/env bash

polybar-msg cmd quit
while pgrep -u $UID -x polybar > /dev/null; do sleep .5; done

msg_start_header() {
    echo "---"
    echo "Starting Polybar"
    date
    echo "---"
}

msg_start_header | tee -a /tmp/polybar.laptop.log
polybar laptop --reload 2>&1 | tee -a /tmp/polybar.laptop.log & disown
