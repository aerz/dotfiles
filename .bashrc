#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Shell
# ------------------------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default prompt
PS1='[\u@\h \W]\$ '

# Use bash-completion when available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

# ------------------------------------------------------------------------------
# Wayland
# ------------------------------------------------------------------------------
#[ "$(tty)" = "/dev/tty1" ] && exec sway

# ------------------------------------------------------------------------------
# Alias
# ------------------------------------------------------------------------------
alias p="sudo pacman"
alias g="git"
alias emacs="emacsclient -c -a 'emacs'"
alias cu="checkupdates; paru -Qum"

# Enable colors
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
# __fzf_history() {
#     builtin history -a
#     builtin history -c
#     builtin history -r
#     builtin typeset \
#         READLINE_LINE_NEW="$(
#             HISTTIMEFORMAT= builtin history |
#                 command fzf +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r |
#                 command sed '
#                 /^ *[0-9]/ {
#                     s/ *\([0-9]*\) .*/!\1/;
#                     b end;
#                 };
#                 d;
#                 : end
#             '
#         )"

#     if
#         [[ -n $READLINE_LINE_NEW ]]
#     then
#         builtin bind '"\er": redraw-current-line'
#         builtin bind '"\e^": magic-space'
#         READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${READLINE_LINE_NEW}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
#         READLINE_POINT=$((READLINE_POINT + ${#READLINE_LINE_NEW}))
#     else
#         builtin bind '"\er":'
#         builtin bind '"\e^":'
#     fi
# }

# builtin set -o histexpand
# builtin bind -x '"\C-x1": __fzf_history'
# builtin bind '"\C-r": "\C-x1\e^\er"'

alias grep='grep --color=auto'
alias tree='tree -C'
alias diff='diff --color=always'

alias ..='cd ..'
alias ls='eza --icons'
alias l='ls -lgh'
alias la='ls -lgah'
alias lt='eza --tree'

alias df='df -h'
alias cp='cp -i'

# SSH/GPG
# Change terminal emulator on ssh connections
alias ssh='TERM=xterm-256color ssh'
alias keychain='keychain --quiet'
alias sshak="keychain --quiet --inherit any --attempts 2"
alias gpgak="keychain --quiet --nogui --attempts 2"
alias sshsum='ssh-keygen -l -f'

# git
alias gitlg='git log --graph --all --topo-order --decorate --oneline --boundary'

# List GPG keys loaded
alias gpgls='gpg --list-secret-keys --keyid-format LONG'

yay() {
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
            [[ $(/usr/bin/yay -Qdtq) ]] && /usr/bin/yay -Qdtq | /usr/bin/yay -Rns - || echo "No orphan pkgs found"
            ;;
        # Extend clear cache command showing cache sizes
        "-Xcc")
            echo "Cache size by path:"
            du -sh /var/cache/pacman/pkg /var/lib/pacman "$HOME/.cache/yay"
            echo && /usr/bin/yay -Sc
            ;;
        # Show package reverse dependencies in a text tree
        "-Xrd")
            if [ "$2" == "" ]; then
                echo "err: you must provide a package name"
                echo "usage: yay -Xrd <pkg>"
                return 1
            fi

            pactree -r "$2"
            ;;
        # Show package reverse dependencies in a graph
        "-Xrdg")
            if [ "$2" == "" ]; then
                echo "err: you must provide a package name"
                echo "usage: yay -Xrdg <pkg>"
                return 1
            fi

            file="$(mktemp --suff=.png)"
            gfile="$(mktemp --suff=.dot)"
            pactree -g $2 >"$gfile"
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
            pkill -SIGRTMIN+8 waybar
            /usr/bin/yay $@
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
    mimeo $@ >/dev/null 2>&1 &
}

# Files
optipng-dir() {
    for file in *.png; do
        optipng "$file" -out "$file"
    done
}

function extract {
 if [ $# -eq 0 ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso|.zst>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 fi
    for n in "$@"; do
        if [ ! -f "$n" ]; then
            echo "'$n' - file doesn't exist"
            return 1
        fi

        case "${n%,}" in
          *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                       tar zxvf "$n"       ;;
          *.lzma)      unlzma ./"$n"      ;;
          *.bz2)       bunzip2 ./"$n"     ;;
          *.cbr|*.rar) unrar x -ad ./"$n" ;;
          *.gz)        gunzip ./"$n"      ;;
          *.cbz|*.epub|*.zip) unzip ./"$n"   ;;
          *.z)         uncompress ./"$n"  ;;
          *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar|*.vhd)
                       7z x ./"$n"        ;;
          *.xz)        unxz ./"$n"        ;;
          *.exe)       cabextract ./"$n"  ;;
          *.cpio)      cpio -id < ./"$n"  ;;
          *.cba|*.ace) unace x ./"$n"     ;;
          *.zpaq)      zpaq x ./"$n"      ;;
          *.arc)       arc e ./"$n"       ;;
          *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                            extract "$n.iso" && \rm -f "$n" ;;
          *.zlib)      zlib-flate -uncompress < ./"$n" > ./"$n.tmp" && \
                            mv ./"$n.tmp" ./"${n%.*zlib}" && rm -f "$n"   ;;
          *.dmg)
                      hdiutil mount ./"$n" -mountpoint "./$n.mounted" ;;
          *.zst)      zstd -d ./"$n"  ;;
          *)
                      echo "extract: '$n' - unknown archive method"
                      return 1
                      ;;
        esac
    done
}

# yt-dlp
yt-dlp-audio() {
    local -a args
    local album artist meta

    while (($# > 0)); do
        case $1 in
            --album)
                album="$2"
                shift 2
                ;;
            --artist)
                artist="$2"
                shift 2
                ;;
            *)
                args=("$@")
                shift $#
                ;;
        esac
    done

    # https://github.com/yt-dlp/yt-dlp#modifying-metadata
    [[ -n "$album" ]] && meta+="-metadata album='${album}' "
    [[ -n "$artist" ]] && meta+="-metadata artist='${artist}'"

    yt-dlp \
        --extract-audio \
        --add-metadata \
        --embed-thumbnail \
        --parse-metadata 'playlist_index:%(track_number)s' \
        --convert-thumbnails jpg \
        --postprocessor-args "ffmpeg: -c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" \
        --postprocessor-args "Metadata:${meta}" \
        --retries infinite \
        --extractor-retries infinite \
        --force-overwrite \
        --output '%(playlist_index|)s%(playlist_index&. |)s%(title)s [%(id)s].%(ext)s' \
        "${args[@]}"
}

yt-dlp-vimeo() {
    local cookies="$1" ref="$2" vid="$3" out="$4"

    if [[ -z "$cookies" || -z "$ref" || -z "$out" || -z "$vid" ]]; then
        echo "error! ${FUNCNAME[0]} <cookie.txt> <referer> <video-url> <filename>"
        return 1
    fi

    yt-dlp \
        --concurrent-fragments 8 \
        --cookies "$cookies" \
        --referer "$ref" \
        --output "$out" \
        "$vid"
}

yt-dlp-live() {
    local args=("$@")

    yt-dlp --downloader ffmpeg --hls-use-mpegts "${args[@]}"
}

# ------------------------------------------------------------------------------
# Terminal
# ------------------------------------------------------------------------------

# Display current path on title bar
case ${TERM} in
    alacritty)
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s: %s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
        ;;
esac

# ------------------------------------------------------------------------------
# nvm
# ------------------------------------------------------------------------------
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

eval "$(mcfly init bash)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
