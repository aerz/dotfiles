#!/bin/bash

#######################################
# Link dotfiles from repo to their
# destination
# Globals:
#   DOTFILES_DIR
#######################################
install() {
  # git
  echo "Setting up git..."
  ln -svi "${DOTFILES_DIR}/git/.gitconfig" "${HOME}/.gitconfig"
  ln -svi "${DOTFILES_DIR}/git/.gitignore_global" "${HOME}/.gitignore_global"
  
  # ZSH
  echo ""
  echo "Setting up zsh..."
  ln -svi "${DOTFILES_DIR}/zsh/.zshrc" "${HOME}/.zshrc"
}
