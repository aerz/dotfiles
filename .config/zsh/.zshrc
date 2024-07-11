# shellcheck disable=SC2296,SC2016,SC1091,SC2034
# ------------------------------------------------------------------------------
# Plugin manager (zinit)
# ------------------------------------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------
zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" zsh-users/zsh-syntax-highlighting \
    atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' zsh-users/zsh-completions \
    MichaelAquilina/zsh-you-should-use \
    MichaelAquilina/zsh-auto-notify

# fzf-tab
zinit wait lucid light-mode for \
    atinit'eval "$(fzf --zsh)"' atload'eval "$(zoxide init --cmd cd zsh)"' \
    Aloxaf/fzf-tab

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always $realpath'

# zsh-history-substring-search
zinit wait lucid light-mode for zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# ------------------------------------------------------------------------------
# Snippets
# ------------------------------------------------------------------------------
zinit wait lucid for \
    OMZ::plugins/archlinux \
    OMZ::plugins/command-not-found \
    OMZ::plugins/sudo

# ------------------------------------------------------------------------------
# Completions
# ------------------------------------------------------------------------------
zinit wait lucid as'completion' for \
    https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
    OMZ::plugins/fd/_fd

# ------------------------------------------------------------------------------
# Shell
# ------------------------------------------------------------------------------
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/kb.zsh"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/hist.zsh"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/shell/aliasrc"
zinit wait lucid for \
    is-snippet "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/func.zsh"

# ------------------------------------------------------------------------------
# Autoload
# ------------------------------------------------------------------------------
# cache support xdg base directory
[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh" ] || \
    mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh"

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-${HOME}.cache}/zsh/zcompdump-${ZSH_VERSION}"
zinit cdreplay -q

# ------------------------------------------------------------------------------
# Completion styling (zutil)
# ------------------------------------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"

# ------------------------------------------------------------------------------
# Prompt (PS1)
# ------------------------------------------------------------------------------
# eval "$(starship init zsh)"
eval "$(oh-my-posh init --config "${XDG_CONFIG_HOME:-${HOME}/.config}/ohmyposh/zen.toml" zsh)"
