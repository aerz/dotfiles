#!/bin/sh

# ---
# Systemd bus import environments
# ---
# Source: /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
#
systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# ---
# Load Xresources
# ---
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# ---
# Session env vars
# ---
export PATH="$PATH:$HOME/.local/bin"
export QT_QPA_PLATFORMTHEME='gnome'

# Unused
#export GTK_THEME=":dark"
#export QT_STYLE_OVERRIDE="Adwaita-Dark"

# ---
# Start i3
# ---
exec i3
