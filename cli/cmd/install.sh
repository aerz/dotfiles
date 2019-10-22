#!/bin/bash

#######################################
# Link dotfiles from repo to their
# destination
# Globals:
#   DOTFILES_DIR
#   USER_DIR
#######################################
install() {
  # git
  echo "Setting up git..."
  ln -svi "${DOTFILES_DIR}/git/.gitconfig" "${USER_DIR}/.gitconfig"
  ln -svi "${DOTFILES_DIR}/git/.gitignore_global" "${USER_DIR}/.gitignore_global"
  
  # ZSH
  echo ""
  echo "Setting up zsh..."
  ln -svi "${DOTFILES_DIR}/zsh/.zshrc" "${USER_DIR}/.zshrc"
}
