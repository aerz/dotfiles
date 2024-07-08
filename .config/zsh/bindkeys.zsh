# emacs
bindkey -e

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# alt+arrow
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# delete
bindkey '^[[3~' delete-char
