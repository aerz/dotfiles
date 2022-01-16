#
# ~/.bashrc
#

# ---
# Shell
# ---

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt configuration
PS1='[\u@\h \W]\$ '

# ---
# X Session
# ---

# Start a new xorg session by default wether it does not exist
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# ---
# Alias
# ---

# Enable colors
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

alias grep='grep --color=auto'
alias tree='tree -C'
alias diff='diff --color=always'

alias ..='cd ..'
alias ls='exa --icons'
alias l='ls -lgh'
alias la='ls -lgah'

lt() {
    [ -z "$1" ] && exa --tree || exa --tree --level=$1
}

alias df='df -h'
alias cp='cp -i'

# Change terminal emulator on ssh connections
alias ssh='TERM=xterm-256color ssh'

# Add GPG or SSH keys to default agent
alias sshak="keychain --quiet --attempts 2 --agents ${KEYCHAIN_SSH_AGENT}"
alias gpgak="keychain --quiet --nogui --attempts 2 --agents ${KEYCHAIN_GPG_AGENT}"
# Clean all the identities loaded
alias sshcl='keychain --clear'
alias sshsum='ssh-keygen -l -f'

# List GPG keys loaded
alias gpgls='gpg --list-secret-keys --keyid-format LONG'

alias pa='paru'
# Remove orphan packages
alias pacl='[[ `paru -Qdtq` ]] && paru -Qdtq | paru -Rns - || echo No orphan pkgs found'
# Remove all pacman and aur cache files
alias paclr="du -sh /var/cache/pacman/pkg /var/lib/pacman $HOME/.cache/paru && paru -Sc"

# Show packages with dependecy cycles
pacycles() {
    for pkg in $(pacman -Qq); do
        if pactree -l "$pkg" | tail -n +2 | grep -Fqx "$pkg"; then
            echo "${pkg}"
        fi
    done
}

# Show package reverse tree in graph or text
pardeps() {
    if [ "$1" == "-g" ]; then
        file="$(mktemp --suff=.png)"; gfile="$(mktemp --suff=.dot)"
        pactree -g $2 > "$gfile"
        dot "$gfile" -Tpng -o "$file"
        sxiv "$file" && rm "$file" "$gfile" &
    else
        pactree -r $1
    fi
}

# translate-shell
alias transd='trans :en'
alias transs='trans -t es'
alias transe='trans -t en'

# Copy to default clipboard
alias pbcopy='xclip -selection clipboard'

# Debug
alias jxe='journalctl -xe'
alias dw='sudo dmesg -w'
alias udm='sudo udevadm monitor'

alias clamupdate='sudo freshclam'

# Open
alias open="mimeo"
alias openwith="mimeopen --ask-default"

opend() {
    mimeo $@ > /dev/null 2>&1 &
}

# Files
extract() {
    if [ ! -f "$1" ]; then
        echo "'$1' is not a valid file" && return 1
    fi

    # folder name
    local fn="$(echo "$1" | sed 's/\.\w*$//;s/\.tar$//')"

    case $1 in
        *.tar)       tar xvf $1      ;;
        *.tar.bz2)   tar xvjf $1     ;;
        *.tar.gz)    tar xvzf $1     ;;
        *.tar.zst)
            mkdir "$fn" && tar --use-compress-program=unzstd -xvf $1 -C "$fn"
        ;;
        *.tbz2)      tar xvjf $1     ;;
        *.tgz)       tar xvzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.zip)       unzip $1 -d "$fn"      ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
}
# ---
# Polybar
# ---

# Display current path on title bar
case ${TERM} in
    alacritty)
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

# ---
# NVM
# ---
lazynvm() {
    unset -f nvm node npm npx
    export NVM_DIR="$XDG_CONFIG_HOME/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm() {
    lazynvm
    nvm $@
}

node() {
    lazynvm
    node $@
}

npm() {
    lazynvm
    npm $@
}

npx() {
    lazynvm
    npx $@
}

# ---
# Autostart
# ---

# mcfly
if which mcfly &> /dev/null; then
    export MCFLY_RESULTS=200 MCFLY_FUZZY=2
    eval "$(mcfly init bash)"
fi
