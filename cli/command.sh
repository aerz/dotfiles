#!/bin/bash

# list of available commands
declare -ar COMMAND_LIST=(
  "configure_zsh"
  "defaults"
  "help"
  "install"
  "install_apps"
  "install_app_store_apps"
)

#######################################
# Execute the command when exists
# Globals:
#   CLI_DIR
# Arguments:
#   input_command
#######################################
execute_command() {
  local input_command="$1"

  if [ -z "$input_command" ]; then
    source "${CLI_DIR}/cmd/help.sh"
    help

    exit 0
  fi

  for command in "${COMMAND_LIST[@]}"; do
    if [ "$input_command" = "$command" ]; then
      source "${CLI_DIR}/cmd/${command}.sh"
      $command

      exit 0
    fi
  done

  source "${CLI_DIR}/messages.sh"
  msg_command_not_found "$input_command"

  exit 1
}
