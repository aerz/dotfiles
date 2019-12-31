#!/usr/bin/env bash

log::header "Checking dot command..."

if ! check::command_installed "dot" &> /dev/null ; then
  log::info "dot command not found, installing..."
  log::info "Requesting elevated privileges to create the symlink"
  $DOTMAN_BIN -config "$DOT_SYMLINKS"
  log::info "✔ Installed. Start typing dot to manage the dotfiles and using other scripts"
fi

symlink_dot=$(
  ls -l /usr/local/bin | # list files on the final destination
  grep --word-regexp "dot" | # get only dot binary
  cut -f 2 -d ">" | # get symlink path from result
  cut -f 2 -d " " # remove first space on the path
)

if ! [ "$symlink_dot" == "$DOT_BIN" ]; then
  log::info "dot folder changed, creating new symlink"
  $DOTMAN_BIN -config "$DOT_SYMLINKS"
fi

check::command_installed "dot" -v
