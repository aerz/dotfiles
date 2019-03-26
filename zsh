#!/bin/bash

set -e

if ! [ -x "$(which brew)" ]; then
    echo "You must install first Homebrew to run this script."
    exit 0
fi

# Install ZSH
brew install zsh

# Install ZSH Plugins
brew install zsh-syntax-highlighting

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
