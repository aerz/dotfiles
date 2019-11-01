#!/usr/bin/env bash

ln -sfv "${DOTFILES_PATH}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sfv "${DOTFILES_PATH}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

while IFS= read -r extension; do
  code --install-extension "$extension"
done < "${DOTFILES_PATH}/vscode/extensions.vsc"
