#!/bin/bash

#######################################
# Customize zsh
#######################################
configure_zsh() {
  if ! [ -x "$(command -v brew)" ]; then
    echo "You must install Homebrew to run this command"
    exit 1
  fi

  brew install zsh-syntax-highlighting zsh-autosuggestions

  # get z command
  if ! [ -e "/usr/local/etc/profile.d/z" ]; then
    git clone https://github.com/rupa/z.git /usr/local/etc/profile.d/z
  fi

  # spaceship zsh
  if ! [ -d "~/.oh-my-zsh/custom/themes/spaceship-prompt" ]; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git "~/.oh-my-zsh/custom/themes/spaceship-prompt"
    ln -sfv "~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "~/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
  fi

  # install oh my zsh

  if ! [ -e "~/.oh-my-zsh/oh-my-zsh.sh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
}
