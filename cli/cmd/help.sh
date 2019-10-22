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
  echo "  help      Shows information about the cli usage"
  echo "  install   Link saved dotfiles to their original location"
  echo ""
  
  exit 0
}
