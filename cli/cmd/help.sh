#!/bin/bash

#######################################
# Shows the cli usage information
#######################################
help() {
  echo ""
  echo "Usage:  ./dotfiles COMMAND"
  echo ""
  echo "Personal dotfiles installer for macOS 10.15+"
  echo ""
  echo "Commands:"
  echo "  configure_iterm         Install all the iTerm configurations"
  echo "  configure_vscode        Install VSCode configurations"
  echo "  configure_zsh           Install zsh customizations"
  echo "  defaults                Set the macOS defaults"
  echo "  help                    Show information about the cli usage"
  echo "  install                 Link saved dotfiles to their original location"
  echo "  install_apps            Install macOS apps using brew"
  echo "  install_app_store_apps  Install App Store apps using mas"
  echo ""
}
