#
# cd to next dir including hidden dirs
#
fcd() {
  local dir
  dir=$(ls -la1p | grep "/" | tr -d "/" | fzf --reverse) &&
  cd "$dir"
}

#
# Find a directory from the current or specific path and moves to it
#
ffind() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

#
# Interactive cd
#
ficd() {
  if [[ "$#" != 0 ]]; then
    builtin cd "$@";
    return
  fi

  while true; do
    local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
    local dir="$(printf '%s\n' "${lsd[@]}" |
      fzf --reverse --preview '
      __cd_nxt="$(echo {})";
      __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
      echo $__cd_path;
      echo;
      ls -pG "${__cd_path}";
    ')"

    [[ ${#dir} != 0 ]] || return 0
    builtin cd "$dir" &> /dev/null
  done
}
