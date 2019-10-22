#!/bin/bash

configure_vscode() {
  ln -svi "${DOTFILES_DIR}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
  ln -svi "${DOTFILES_DIR}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

  while IFS= read -r extension; do
    code --install-extension "$extension"
  done < "${DOTFILES_DIR}/vscode/extensions.vsc"
}
