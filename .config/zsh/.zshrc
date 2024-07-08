# shellcheck disable=SC2296,SC2016,SC1091
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
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# cache support xdg base directory
[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh" ] || \
    mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh"

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-${HOME}.cache}/zsh/zcompdump-${ZSH_VERSION}"
zinit cdreplay -q

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# alt+arrow
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
# delete
bindkey '^[[3~' delete-char

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
zstyle ':completion:*' menu no
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always $realpath'

# aliases
source "${XDG_CONFIG_HOME:-${HOME}/.config}/shell/aliasrc"

# load functions
source "${XDG_CONFIG_HOME:-${HOME}/.config}/shell/yazi.sh"

# init
eval "$(oh-my-posh init --config "${XDG_CONFIG_HOME:-${HOME}/.config}/ohmyposh/zen.toml" zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
