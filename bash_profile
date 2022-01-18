#!/usr/bin/env bash

# ---
# Defaults
# ---
export EDITOR="emacs"
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
# AUR Flags
# ---
# brave
export USE_SCCACHE=1

# ---
# Start a default keychain agent
# ---
export KEYCHAIN_SSH_AGENT="ssh"
export KEYCHAIN_GPG_AGENT="gpg"
eval `keychain --eval --quiet --systemd --agents ${KEYCHAIN_SSH_AGENT},${KEYCHAIN_GPG_AGENT}`

# ---
# Load bashrc
# ---
[[ -f ~/.bashrc ]] && . ~/.bashrc
