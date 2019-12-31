#!/usr/bin/env bash

log::header "Analyzing dotfiles..."

if ! [ -d "$DOTFILES_PATH" ]; then
  log::info "dotfiles not found, installing it into ${DOTFILES_PATH}"
  run_chronic "git clone https://github.com/aerz/dotfiles.git ${DOTFILES_PATH}"
  log::info "✔ Installed"
else
  log::info "dotfiles found. Updating..."
  run_chronic "git --git-dir=$DOTFILES_PATH/.git pull"
  log::info "✔ Done"
fi
