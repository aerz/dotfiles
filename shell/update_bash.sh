#!/usr/bin/env bash

set -e

if ! [ -x "$(command -v brew)" ]; then
    echo "You must install Homebrew to run this script."
    exit 0
fi

brew install bash

sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
bash --version

# Make it default shell
# chsh -s /usr/local/bin/bash
