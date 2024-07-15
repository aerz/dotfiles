# ------------------------------------------------------------------------------
# paru
# ------------------------------------------------------------------------------
fzf_paru_install() {
    paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}'| xargs -ro paru -S
}

fzf_paru_remove() {
    paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

# ------------------------------------------------------------------------------
# yazi
# ------------------------------------------------------------------------------
# yazi moves you to last directory
ya() {
  local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd "$cwd" || return
  fi
  rm -f "$tmp"
}

# ------------------------------------------------------------------------------
# cd / zoxide
# ------------------------------------------------------------------------------
# find directory from current location
fzf_find_dir() {
  cd "$(find "${1:-$(pwd)}" -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)" || \
    exit
}

# ------------------------------------------------------------------------------
# docker
# ------------------------------------------------------------------------------
fzf_docker_attach() {
  local c
  c=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$c" ] && docker start "$c" && docker attach "$c"
}

fzf_docker_stop() {
  local c
  c=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$c" ] && docker stop "$c"
}

fzf_docker_rm() {
  local c
  c=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$c" ] && docker rm "$c"
}
