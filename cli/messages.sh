#!/bin/bash

#######################################
# Shows command not found error
# Arguments:
#   command
#######################################
function msg_command_not_found {
  local command="$1"

  echo "dotfiles: '${command}' is not a valid command"
  echo "See dotfiles usage"
  exit 1
}
