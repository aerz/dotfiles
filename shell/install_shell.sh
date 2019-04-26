#!/usr/bin/env bash

set -e

if ! [ -x "$(command -v brew)" ]; then
    echo "You must install Homebrew to run this script."
    exit 0
fi

brew install \
    'zsh' \
    'zsh-syntax-highlighting'

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Spaceship ZSH (https://denysdovhan.com/spaceship-prompt)
git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt"
ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Get z command
git clone https://github.com/rupa/z.git /usr/local/etc/profile.d/z
