#!/usr/bin/env zsh

log::error() {
  local msg="$1"
  echo -e "${RED} Error: ${msg}${NO_COLOR}"
  return 1
}

log::info() {
  local msg="$1"
  echo -e "${BLUE}==> ${msg}${NO_COLOR}"
}

log::header() {
  local msg="$1"
  echo
  echo -e "${msg}"
  echo "----------------------------------"
}
