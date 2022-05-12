#!/usr/bin/env bash

# ---
# Shell
# ---

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt configuration
PS1='[\u@\h \W]\$ '

# Use bash-completion when available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# ---
# X Session
# ---

# Start a new xorg session by default wether it does not exist
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx "$XINITRC" -- -keeptty >$XDG_DATA_HOME/xorg/xorg.tty.log 2>&1
fi

# ---
# Alias
# ---
man() {
    local page

    if [[ $# -eq 0 ]]; then
         page=$(man -k . | fzf --prompt='Man> ' | awk '{print $1}')
    fi

    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "${@:-$page}"
}

# Another CTRL-R script to insert the selected command from history into the command line/region
__fzf_history ()
{
    builtin history -a;
    builtin history -c;
    builtin history -r;
    builtin typeset \
        READLINE_LINE_NEW="$(
            HISTTIMEFORMAT= builtin history |
            command fzf +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r |
            command sed '
                /^ *[0-9]/ {
                    s/ *\([0-9]*\) .*/!\1/;
                    b end;
                };
                d;
                : end
            '
        )";

        if
                [[ -n $READLINE_LINE_NEW ]]
        then
                builtin bind '"\er": redraw-current-line'
                builtin bind '"\e^": magic-space'
                READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${READLINE_LINE_NEW}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
                READLINE_POINT=$(( READLINE_POINT + ${#READLINE_LINE_NEW} ))
        else
                builtin bind '"\er":'
                builtin bind '"\e^":'
        fi
}

builtin set -o histexpand;
builtin bind -x '"\C-x1": __fzf_history';
builtin bind '"\C-r": "\C-x1\e^\er"'

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


# SSH/GPG
# Change terminal emulator on ssh connections
alias ssh='TERM=xterm-256color ssh'
alias keychain='keychain --quiet'
alias sshak="keychain --quiet --inherit any --attempts 2"
alias gpgak="keychain --quiet --nogui --attempts 2"
alias sshsum='ssh-keygen -l -f'
# List GPG keys loaded
alias gpgls='gpg --list-secret-keys --keyid-format LONG'

yay() {
    local ybin="$(which yay)"

    case "$1" in
        # Show help
        "-Xh")
            echo "Usage:"
            echo "    yay -X[custom] [package]"
            echo
            echo "Custom options:"
            echo "    yay -Xco              Removes orphan packages"
            echo "    yay -Xcc              Extend clear cache command showing cache sizes"
            echo "    yay -Xrd  <package>   Show package reverse dependencies in a text tree"
            echo "    yay -Xrdg <package>   Show package reverse dependencies in a graph"
            echo "    yay -Xdc              Show packages with dependency cycles"
            echo "    yay -Xh               Show this help"
        ;;
        # Remove orphan packages
        "-Xco")
            [[ `$ybin -Qdtq` ]] && $ybin -Qdtq | $ybin -Rns - || echo "No orphan pkgs found"
        ;;
        # Extend clear cache command showing cache sizes
        "-Xcc")
            echo "Cache size by path:"
            du -sh /var/cache/pacman/pkg /var/lib/pacman $HOME/.cache/yay
            echo && $ybin -Sc
        ;;
        # Show package reverse dependencies in a text tree
        "-Xrd")
            if [ "$2" == "" ]; then
                echo "err: you must provide a package name"
                echo "usage: yay -Xrd <pkg>"
                return 1
            fi

            pactree -r $2
        ;;
        # Show package reverse dependencies in a graph
        "-Xrdg")
            if [ "$2" == "" ]; then
                echo "err: you must provide a package name"
                echo "usage: yay -Xrdg <pkg>"
                return 1
            fi

            file="$(mktemp --suff=.png)"; gfile="$(mktemp --suff=.dot)"
            pactree -g $2 > "$gfile"
            dot "$gfile" -Tpng -o "$file"
            sxiv "$file" && rm "$file" "$gfile" &
        ;;
        # Show packages with dependency cycles
        "-Xdc")
            echo "Packages with dependency cycles:"
            for pkg in $(pacman -Qq); do
                if pactree -l "$pkg" | tail -n +2 | grep -Fqx "$pkg"; then
                    echo "  ${pkg}"
                fi
            done
        ;;
        # Default
        *)
            $ybin $@
        ;;
    esac
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
