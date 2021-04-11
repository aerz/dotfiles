#
# ~/.bash_profile
#

# Default programs
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="brave"

# Define XDG Base Directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Change default GOPATH
export GOPATH="$XDG_DATA_HOME/go"

# Add extra directories in PATH variable
export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin"

# Start a default keychain agent
eval `keychain --eval --quiet --systemd --agents ssh,gpg`

# Load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
