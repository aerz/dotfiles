#!/bin/bash

#######################################
# Configure iTerm
#######################################
configure_iterm() {
  # Change preferences directory iTerm2
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${DOTFILES_DIR}/terminal/iterm2"
  
  # Load custom preferences iTerm2
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
}
