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
