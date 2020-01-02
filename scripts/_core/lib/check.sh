#!/usr/bin/env zsh

#######################################
# Checks command exist in your shell
# Arguments:
#   -v # shows an output
#######################################
check::command_installed() {
  local command="$1"
  local opt="${2:-}" # default is empty

  if ! [ -x "$(command -v $command)" ]; then
    if [ "$opt" == "-v" ]; then
      log::error "'${command}' is not installed. Install it and try again"
    fi

    return 1
  fi

  log::done "✔ ${command}"
}
