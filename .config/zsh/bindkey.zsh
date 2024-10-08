#
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html

# use `cat -v` to see the symbols
# `^ = ctrl`, `^[ = alt`, `\e or \E = esc`

# list all bindkeys
# bindkey -M main

# list all available widgets
# zle -al

# emacs
bindkey -e

bindkey '^p' history-search-backward # ctrl+p
bindkey '^n' history-search-forward  # ctrl+n

bindkey "^[[1;3D" backward-word   # alt+arrow left
bindkey "^[[1;3C" forward-word    # alt+arrow right
bindkey '^[[3~' delete-char       # delete
bindkey '^[[7~' beginning-of-line # home
bindkey '^[[H' beginning-of-line  # home

bindkey '^[[Z' undo # shift+tab
