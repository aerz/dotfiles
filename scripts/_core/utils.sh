utils::check_command() {
  if [ $(command -v "$1") ]; then
    return 0
  fi

  return 1
}
