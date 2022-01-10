#!/bin/sh

# ---
# Start XSettings Daemon
# ---
xfsettingsd --replace --daemon

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
export QT_QPA_PLATFORMTHEME='gnome'

# Unused
#export PATH="$PATH:$HOME/.local/bin"
#export GTK_THEME=":dark"
#export QT_STYLE_OVERRIDE="Adwaita-Dark"

# ---
# X Preferences
# ---
# Monitor
standby=600; suspend=600; off=600
xset dpms $standby $suspend $off &

# Lockscreen
inactivity=600; force_bg=180
xset s $inactivity $force_bg s blank s noexpose &
xss-lock -l -- multilockscreen --lock blur &

# ---
# Start i3
# ---
exec i3
