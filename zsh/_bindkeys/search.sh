_reverse_search() {
  eval $(fc -rl 1 | awk '{$1="";print substr($0,2)}' | fzf)
}

zle -N _reverse_search
bindkey '^R' _reverse_search
