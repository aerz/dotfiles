#!/bin/bash

if [ ! -x "$(command -v brew)" ]; then
  echo "You must install Homebrew to run this command"
  exit 1
fi

# make an alias to dotfiles
ln -sfv "${DOTFILES_PATH}/zsh/.zshrc" "${HOME}/.zshrc"

brew install zsh-syntax-highlighting zsh-autosuggestions zplug

# get z command
if [ ! -e "/usr/local/etc/profile.d/z" ]; then
  git clone https://github.com/rupa/z.git /usr/local/etc/profile.d/z
fi

# spaceship zsh
if [ ! -d "${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt" ]; then
  git clone https://github.com/denysdovhan/spaceship-prompt.git "${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt"
  ln -sfv "${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
fi

# install oh my zsh
if [ ! -e "~/.oh-my-zsh/oh-my-zsh.sh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
