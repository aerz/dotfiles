#!/usr/bin/env bash

# fallback prompt
PS1='[\u@\h \W]\$ '

[[ -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

source "$HOME/.config/shell/aliasrc"
source "$HOME/.config/shell/bash/func.sh"
source "$HOME/.config/shell/bash/init.sh"
