#!/usr/bin/env bash

# interactive or do nothing
[[ $- != *i* ]] && return

# fallback prompt
PS1='[\u@\h \W]\$ '

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

source "$HOME/.config/shell/aliasrc"

# init
source "$HOME/.config/shell/bash/mcfly.sh"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
