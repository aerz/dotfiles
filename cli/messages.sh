#!/usr/bin/env bash

command_help() {
  echo ""
  echo "Usage:  dot <command> <sub_command>"
  echo ""
  echo "Commands:"
  echo "  configure"
  echo "    iterm                 Install all the iTerm configurations"
  echo "    vscode                Install VSCode configurations"
  echo "    zsh                   Install zsh customizations"
  echo ""
  echo "  macos"
  echo "    defaults              Set the macOS defaults"
  echo ""
  echo "  install"
  echo "    brew_apps             Install macOS apps using brew"
  echo "    app_store_apps        Install App Store apps using mas"
  echo ""
  echo "  help                    Show information about the cli usage"
  echo ""
}

command_not_found() {
  local command="$1"

  echo "dot: '${command}' is not a valid command"
  echo "See dot command usage"
}

sub_command_not_found() {
  local command="$1"
  local sub_command="$2"

  echo "dot: ${command} ${sub_command} is not a valid command"
  echo "See dot command usage"
}
