#!/usr/bin/env zsh

if ! [ "$DOTFILES_CONFIG" ]; then
  echo "Error: dotfiles config is required."
  echo "Check your script and load init after config file"
  exit 1
fi

for l in "${DOT_SCRIPTS_PATH}/_core/lib/"*".sh"; do
  source $l
done

if ! [ -d "$DEPENDENCIES_PATH" ]; then
  mkdir "$DEPENDENCIES_PATH"
fi
