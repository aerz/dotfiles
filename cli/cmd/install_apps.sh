#!/bin/bash

#######################################
# Install listed apps using brew
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

  local brew_apps=(
    bash
    docker-compose
    mas
    grep
    ruby
    shellcheck
    tldr
    tree
    youtube-dl
    wget
  )

  for app in "${brew_apps[@]}"; do
    brew install "$app"
  done

  local brew_cask_apps=(
    appcleaner
    balenaetcher
    calibre
    clover-configurator
    contexts
    cyberduck
    discord
    docker
    downie
    firefox
    firefox-developer-edition
    font-fira-code
    google-chrome
    google-chrome-canary
    hyper
    iina
    iterm2
    nativedisplaybrightness
    notion
    pocket-casts
    postman
    safeincloud-password-manager
    sensiblesidebuttons
    skype
    slack
    spark
    spotify
    telegram-desktop
    ticktick
    transmission
    typora
    visual-studio-code
    xmind-zen
  )
  
  for app in "${brew_cask_apps[@]}"; do
    brew cask install "$app"
  done
}
