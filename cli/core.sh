#!/usr/bin/env bash

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

# show sub command help doesn't exist
if [ ! -e "$SUB_COMMAND_FILE" ]; then
  sub_command_not_found "$COMMAND" "$SUB_COMMAND"
  exit 1
fi

# load the command
source "$SUB_COMMAND_FILE"
