#!/usr/bin/env bash

# ---
# Defaults
# ---
export EDITOR="emacsclient -t -a ''"
export VISUAL="emacsclient -c -a emacs"
export TERMINAL="alacritty"
export BROWSER="brave"

# ---
# XDG Base Directory
# ---
# User dirs
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Programs
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XRESOURCES="$XDG_CONFIG_HOME/X11/Xresources"

# Add bin paths to env
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$XDG_CONFIG_HOME/emacs/bin"

# ---
# SSH/GPG Agent
# ---
# Check gnome-keyring is running
if [[ ! -v $SSH_AUTH_SOCK ]]; then
    eval "$(keychain --eval --quiet --systemd --agents ssh,gpg)"
else
    eval "$(keychain --eval --quiet --systemd --inherit any)"
fi

# ---
# Program vars
# ---
export KOPIA_USE_KEYRING=1

# ---
# Load bashrc
# ---
[[ -f ~/.bashrc ]] && . ~/.bashrc
