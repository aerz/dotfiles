#
# ~/.bash_profile
#

# ---
# Defaults
# ---
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="brave"

# ---
# XDG Base Directory
# ---
# User dirs
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Apps
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Add bin paths to env
export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin:$CARGO_HOME/bin"

# ---
# Start a default keychain agent
# ---
eval `keychain --eval --quiet --systemd --agents ssh,gpg`

# ---
# Load bashrc
# ---
[[ -f ~/.bashrc ]] && . ~/.bashrc
