#!/usr/bin/env bash

log::header "Creating symlinks..."

$DOTMAN_BIN -config "$DOTFILES_DEFAULT_SYMLINKS" --force
