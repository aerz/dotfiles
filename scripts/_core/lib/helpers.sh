#!/usr/bin/env zsh

run_chronic() {
  for command in "$@"
  do
    chronic $command
  done
}
