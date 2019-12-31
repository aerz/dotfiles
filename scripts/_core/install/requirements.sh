#!/usr/bin/env bash

log::header "Checking requirements..."

check::command_installed "git" -v
check::command_installed "zsh" -v
check::command_installed "wget" -v
check::command_installed "unzip" -v

if ! [[ "$SHELL" == *"zsh" ]]; then
  log::error "zsh is not the default shell and these dotfiles are optimized for zsh shell\nSet zsh as default shell and try again"
else
  log::info "✔ zsh is the default shell"
fi
