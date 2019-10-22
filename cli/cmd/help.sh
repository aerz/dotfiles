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
  echo "  help                    Shows information about the cli usage"
  echo "  install                 Links saved dotfiles to their original location"
  echo "  install_apps            Installs macOS apps using brew"
  echo "  install_app_store_apps  Installs App Store apps using mas"
  echo "  defaults                Sets the macOS defaults"
  echo ""
  
  exit 0
}
