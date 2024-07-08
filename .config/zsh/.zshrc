# shellcheck disable=SC2296,SC2016,SC1091
# zinit
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
zinit snippet OMZP::sudo

# cache support xdg base directory
[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh" ] || \
    mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh"

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-${HOME}.cache}/zsh/zcompdump-${ZSH_VERSION}"
zinit cdreplay -q

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always $realpath'

# shell
source "${XDG_CONFIG_HOME:-${HOME}/.config}/shell/aliasrc"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/bindkeys.sh"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/history.sh"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/funcs.sh"

# init
eval "$(oh-my-posh init --config "${XDG_CONFIG_HOME:-${HOME}/.config}/ohmyposh/zen.toml" zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
