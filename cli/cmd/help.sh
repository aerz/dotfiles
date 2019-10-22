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
  echo "  defaults                Set the macOS defaults"
  echo "  help                    Show information about the cli usage"
  echo "  install                 Link saved dotfiles to their original location"
  echo "  install_apps            Install macOS apps using brew"
  echo "  install_app_store_apps  Install App Store apps using mas"
  echo ""
  
  exit 0
}
