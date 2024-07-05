# shellcheck disable=SC1091
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
source "${HOME}/.config/shell/aliasrc"

eval "$(oh-my-posh init --config "${XDG_CONFIG_HOME:-${HOME}/.config}/ohmyposh/zen.toml" zsh)"
