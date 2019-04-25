#!/usr/bin/env bash

set -e

# Install homebrew
if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew tap 'homebrew/cask-versions'

install_basic_apps () {
  echo "Installing basic apps"

  brew install \
    'docker-compose' \
    'mas' \
    'mongodb' \
    'ruby' \
    'shellcheck' \
    'tree' \
    'tldr'

  brew cask install \
    'appcleaner' \
    'contexts' \
    'clover-configurator' \
    'font-fira-code' \
    'font-roboto-mono'
    'google-chrome' \
    'enpass' \
    'nightowl' \
    'spectacle' \
    'spotify' \
    'telegram-desktop' \
    'visual-studio-code'

  mas install \
    # Tweetbot 3
    '1384080005' \
    # Spark Email
    '1176895641' \
    # iA Writer
    '775737590'

}

install_complete_apps () {
  install_basic_apps

  brew install 'youtube-dl'

  brew cask install \
    'android-file-transfer' \
    'balenaetcher' \
    'brooklyn' \
    'calibre' \
    'cyberduck' \
    'discord' \
    'docker' \
    'google-backup-and-sync' \
    'handbrake' \
    'megasync' \
    'nativedisplaybrightness' \
    'pocket-casts' \
    'postman' \
    'sensiblesidebuttons' \
    'sequel-pro' \
    'slack' \
    'timemachineeditor' \
    'transmission' \
    'typora' \
    'xmind-zen'

  mas install \
    # Numbers
    '409203825' \
    # Pages
    '409201541' \
    # Pixelmator
    '407963104' \
    # Reeder 3
    '880001334' \
    # Lighten
    #'1447226117' \
    # XCode
    #'497799835' \
    # Pocket
    '568494494' \
    # Encrypto
    '935235287'
}

install_basic_apps
# install_complete_apps
