#!/usr/bin/env zsh

for l in "${DOT_SCRIPTS_PATH}/_core/lib/"*".sh"; do source $l; done

# with no command, context will set to self
if ! [ $command ]; then
  command="$context"
  context="self"
  shift 1
else
  shift 2 # to allow arguments forward to script
fi
