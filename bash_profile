#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Defaults
# ------------------------------------------------------------------------------
export EDITOR="emacsclient -t -a ''"
export VISUAL="emacsclient -c -a emacs"
export TERMINAL="alacritty"
export MANPAGER="nvim +Man!" 
export MANWIDTH="80"

# ------------------------------------------------------------------------------
# Wayland
# ------------------------------------------------------------------------------
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export QT_QPA_PLATFORM='wayland;xcb'
export QT_QPA_PLATFORMTHEME="gnome"
export QT_WAYLAND_DECORATION="adwaita"
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export OBSIDIAN_USE_WAYLAND=1

export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=24
export XDG_CURRENT_DESKTOP=sway

# ------------------------------------------------------------------------------
# XDG Base Directory
# ------------------------------------------------------------------------------
# User dirs
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/:${XDG_DATA_HOME}/flatpak/exports/share:flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME"

# Programs
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XRESOURCES="$XDG_CONFIG_HOME/X11/Xresources"

# Add bin paths to env
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$XDG_CONFIG_HOME/emacs/bin"

# ------------------------------------------------------------------------------
# Apps
# ------------------------------------------------------------------------------
export KOPIA_USE_KEYRING=1

# ------------------------------------------------------------------------------
# SSH Agent
# ------------------------------------------------------------------------------
eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK GNOME_KEYRING_CONTROL

# ------------------------------------------------------------------------------
# shellcheck disable=SC1090
[[ -f ~/.bashrc ]] && source ~/.bashrc
