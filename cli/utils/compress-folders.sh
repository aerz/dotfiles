#!/usr/bin/env bash

set -eou pipefail

check_os_macos() {
  if [[ "$OSTYPE" == *"darwin"* ]]; then
    return true
  fi

  return false
}

if [ ! check_os_macos ]; then
  echo "This script only runs on macOS"
  exit 0
fi

read -rp "Which format do you prefer? [7z, zip] (default: 7z)" format

if [ ! -x "$(command -v 7z)" ]; then
  brew install p7zip
fi

if [ ! -x "$(command -v zip)" ]; then
  brew install zip
fi

for folder in ./*/; do
  # remove special chars
  fileName="$(echo "$folder" | tr -d '/' | tr -d '.' )"

  # compress the folder
  case "$format" in
    "7z")
      7z a "${fileName}.7z" "$folder"
    ;;

    "zip")
      zip -r "${fileName}.zip" "$folder"
    ;;

    # default
    *)
      7z a "${fileName}.7z" "$folder"
    ;;
  esac

done
