#!/bin/bash

# show help message if no command inserted
if [ -z "$COMMAND" ]; then
  command_help
  exit 0
fi

# throws an error if command doesn't exist
if [ ! -d "$COMMAND_PATH" ]; then
  command_not_found "$COMMAND"
  exit 1
fi

# show sub command help if the command doesn't have a default script
if [ -z "$SUB_COMMAND" ] && [ ! -e "${COMMAND_PATH}/default.sh" ]; then
  sub_command_not_found "$COMMAND" "$SUB_COMMAND"
  exit 0
fi

# throws an error if sub command doesn't exist
if [ ! -e "$SUB_COMMAND_FILE" ]; then
  sub_command_not_found "$COMMAND" "$SUB_COMMAND"
  exit 1
fi

# load the command
if [ -z "$SUB_COMMAND" ]; then
  source "${COMMAND_PATH}/default.sh"
else
  source "$SUB_COMMAND_FILE"
fi
