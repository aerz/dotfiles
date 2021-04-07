#
# ~/.bash_profile
#

# Define XDG Base Directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

# Change default GOPATH
export GOPATH="$XDG_DATA_HOME/go"

# Add extra directories in PATH variable
export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin"

# Start a default keychain agent
eval `keychain --eval --quiet --systemd --agents ssh,gpg`

# Load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
