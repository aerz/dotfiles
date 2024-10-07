#
# https://github.com/sindresorhus/pure
#
# newline before prompt issue (+fix)
# https://github.com/sindresorhus/pure/issues/422#issuecomment-452004045
#
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh' \
    atload'ydotool key 29:1 38:1 38:0 29:0; swaymsg mode default' # ctrl+l
zinit light sindresorhus/pure
