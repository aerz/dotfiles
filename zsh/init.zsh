#!/usr/bin/env zsh

# load dotfiles config
source "${DOTFILES_PATH}/config.sh"

# run zplug
source "${ZPLUG_HOME}/init.zsh"

for a in "${DOTFILES_PATH}/zsh/_alias/"*; do
  source $a
done

for e in "${DOTFILES_PATH}/zsh/_exports/"*; do
  source $e
done

for f in "${DOTFILES_PATH}/zsh/_functions/"*; do
  source $f
done
