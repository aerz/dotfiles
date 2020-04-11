docs::extract_help() {
  local -r file="$1"
  grep "^##?" "$file" | cut -c 5-
}

docs::eval() {
  local -r help="$(docs::extract_help $command_path)"

  eval "$(docopts -h "${help}" : "${@:1}")"
}
