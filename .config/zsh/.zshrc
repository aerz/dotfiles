# shellcheck disable=SC1091
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# load zsh-completions
autoload -U compinit && compinit

# load aliases
source "${XDG_CONFIG_HOME:-${HOME}/.config}/shell/aliasrc"

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/history"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"


# support xdg base directory
# https://wiki.archlinux.org/title/XDG_Base_Directory
[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh" ] || \
    mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh"

zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"
compinit -d "${XDG_CACHE_HOME:-${HOME}.cache}/zsh/zcompdump-${ZSH_VERSION}"

# prompt
eval "$(oh-my-posh init --config "${XDG_CONFIG_HOME:-${HOME}/.config}/ohmyposh/zen.toml" zsh)"
