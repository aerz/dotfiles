#!/usr/bin/env zsh

zplug_check_plugins() {
  if ! zplug check --verbose; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
  fi
}
