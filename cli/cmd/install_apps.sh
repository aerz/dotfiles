#!/bin/bash

#######################################
# Install listed apps using brew 
# command
#######################################
install_apps() {
  if ! [ -x "$(command -v brew)" ]; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  
  brew tap homebrew/cask
  brew tap homebrew/cask-drivers
  brew tap homebrew/cask-fonts
  brew tap homebrew/cask-versions
  brew tap homebrew/core

  brew install \
    'bash' \
    'docker-compose' \
    'mas' \
    'grep' \
    'ruby' \
    'shellcheck' \
    'tldr' \
    'tree' \
    'youtube-dl' \
    'wget'
  
  brew cask install \
    'appcleaner' \
    'balenaetcher' \
    'calibre' \
    'clover-configurator' \
    'contexts' \
    'cyberduck' \
    'discord' \
    'docker' \
    'downie' \
    'firefox' \
    'font-fira-code' \
    'google-chrome' \
    'google-chrome-canary' \
    'iina' \
    'iterm2' \
    'nativedisplaybrightness' \
    'pocket-casts' \
    'postman' \
    'sensiblesidebuttons' \
    'slack' \
    'spotify' \
    'telegram-desktop' \
    'transmission' \
    'typora' \
    'visual-studio-code' \
    'xmind-zen'
}
