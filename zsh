#!/bin/bash

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
