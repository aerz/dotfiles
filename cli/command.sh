#!/bin/bash

# list of available commands
declare -ar COMMAND_LIST=(
  "install"
  "help"
  "defaults"
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
  fi

  for command in "${COMMAND_LIST[@]}"; do
    if [ "$input_command" = "$command" ]; then
      source "${CLI_DIR}/cmd/${command}.sh"
      $command
    fi
  done

  source "${CLI_DIR}/messages.sh"
  msg_command_not_found "$input_command"
}
