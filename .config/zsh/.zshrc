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
    MichaelAquilina/zsh-you-should-use

# zsh-auto-notify
zinit wait lucid light-mode for \
    MichaelAquilina/zsh-auto-notify

AUTO_NOTIFY_IGNORE+=("docker" "bat" "nvim" "man" "navi")

# fzf-tab (+fzf +zoxide widgets)
zinit wait lucid light-mode for \
    atinit'eval "$(fzf --zsh)"' \
    atload'eval "$(zoxide init --cmd cd zsh)"' \
    junegunn/fzf-git.sh \
    Aloxaf/fzf-tab

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=3 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --tree --level=3 --color=always $realpath'

# set fzf to use fd instead find
# src: https://github.com/zimfw/fzf/blob/50964d38e4bf0d14b2055aebcac419da0d95f47c/init.zsh#L22
export FZF_DEFAULT_COMMAND="command fd --hidden --no-ignore-vcs --exclude .git --exclude node_modules -td -tf"
export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}
export FZF_CTRL_T_OPTS="--bind ctrl-/:toggle-preview --preview 'command bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND="command fd --hidden --no-ignore-vcs --exclude .git --exclude node_modules -td"
export FZF_ALT_C_OPTS="--bind ctrl-/:toggle-preview --preview 'command eza --tree --level=3 --group-directories-first --color=always -F {}'"

_fzf_compgen_path() {
    command fd -H --no-ignore-vcs -E .git -td -tf . "${1}"
}

_fzf_compgen_dir() {
    command fd -H --no-ignore-vcs -E .git -td . "${1}"
}

# zsh-history-substring-search
zinit wait lucid light-mode for zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# ------------------------------------------------------------------------------
# Widgets
# ------------------------------------------------------------------------------
zinit wait lucid for \
    is-snippet "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/widgets/navi.zsh"

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
    blockf atpull'zinit creinstall -q .' zsh-users/zsh-completions \
    blockf /usr/share/zsh/site-functions \
    OMZ::plugins/docker/completions/_docker

# ------------------------------------------------------------------------------
# Defaults
# ------------------------------------------------------------------------------
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/kb.zsh"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/hist.zsh"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/shell/aliasrc"
zinit wait lucid for \
    is-snippet "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/func.zsh"

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"

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
# Prompt (PS1)
# ------------------------------------------------------------------------------
# source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/prompt/pure.zsh"
# source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/prompt/starship.zsh"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/prompt/ohmyposh.zsh"
