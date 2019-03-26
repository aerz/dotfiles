#!/bin/bash

set -e

if ! [ -x "$(command -v brew)" ]; then
    echo "You must install Homebrew to run this script."
    exit 0
fi

echo 'Installing ZSH...'
brew install zsh

echo 'Installing ZSH plugins...'
brew install zsh-syntax-highlighting

echo 'Installing Oh My ZSH...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
