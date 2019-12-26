#!/usr/bin/env bash

install_dot() {
  sudo ln -s "$DOTFILES_PATH/bin/dot" "$DOT_LOCAL_PATH/dot"
}

check_dot_is_installed() {
  if [ -z "$(ls $DOT_LOCAL_PATH | grep -w 'dot')" ]; then
    echo
    echo "Error: dot command was not installed, try to install it manually..."
    echo

    return 1
  fi

  return 0
}
