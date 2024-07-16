# ------------------------------------------------------------------------------
# starship
# ------------------------------------------------------------------------------
# https://starship.rs
#
window_title() {
    echo -ne "\033]0;$PWD\007"
}

precmd_functions+=(window_title)
eval "$(starship init zsh)"
