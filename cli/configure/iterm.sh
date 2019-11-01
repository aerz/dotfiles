#!/usr/bin/env bash

# Change preferences directory iTerm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${DOTFILES_PATH}/terminal/iterm2"

# Load custom preferences iTerm2
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true