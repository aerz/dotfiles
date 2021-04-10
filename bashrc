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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C'
alias diff='diff --color=always'

alias l='ls -lh'
alias la='ls -lah'

# Change terminal emulator on ssh connections
alias ssh='TERM=xterm-256color ssh'

# Add GPG or SSH keys to default agent
alias sshak='keychain --quiet --attempts 2 --agents ssh'
alias gpgak='keychain --quiet --nogui --attempts 2 --agents gpg'
# Clean all the identities loaded
alias sshcl='keychain --clear'
alias sshsum='ssh-keygen -l -f'

# List GPG keys loaded
alias gpgls='gpg --list-secret-keys --keyid-format LONG'

# Remove orphan packages
alias pacl='[[ `paru -Qdtq` ]] && paru -Qdtq | paru -Rns - || echo No orphan pkgs found'
# Remove all pacman and aur cache files
alias paclr="du -sh /var/cache/pacman/pkg /var/lib/pacman $HOME/.cache/paru && paru -Scc"

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

# ---
# Polybar
# ---

# Display current path on title bar
case ${TERM} in
    alacritty)
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac