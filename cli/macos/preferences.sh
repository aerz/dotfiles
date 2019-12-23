#!/usr/bin/env bash

set -e

osascript "${DOTFILES_PATH}/applescript/bluetooth.scpt"
osascript "${DOTFILES_PATH}/applescript/energy-saver.scpt"