#!/usr/bin/env bash

install_dot() {
  sudo ln -s "${DOTFILES_PATH}/bin/dot" "/usr/local/bin/dot"
}

check_dot_is_installed() {
  if [ -z "$(ls -la /usr/local/bin | grep -w 'dot')" ]; then
    echo
    echo "Error: dot command was not installed, try to install it manually..."
    echo

    return 1
  fi

  return 0
}

clone_dotfiles() {
  git --version
  git clone "DOTFILES_REPO" "$DOTFILES_PATH"
}
