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
  ln -si "${DOTFILES_DIR}/git/.gitconfig" "${USER_DIR}/.gitconfig"
  ln -si "${DOTFILES_DIR}/git/.gitignore_global" "${USER_DIR}/.gitignore_global"
  echo ""

  # ZSH
  echo "Setting up zsh..."
  ln -si "${DOTFILES_DIR}/zsh/.zshrc" "${USER_DIR}/.zshrc"
  echo ""

  exit 0
}
