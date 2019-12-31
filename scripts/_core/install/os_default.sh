#!/usr/bin/env bash

log::header "Running OS default script"

if [[ "$OSTYPE" == "darwin"* ]]; then
  log::info "macOS detected, running default script"
  $DOT_BIN self install_mac
else
  # at the moment, it only supports macOS
  log::error "OS not detected, you need to create a default script before"
fi
