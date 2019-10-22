#!/bin/bash

#######################################
# Install apps from the App Store
#######################################
install_app_store_apps() {
  echo "Maybe you need to open the App Store once before this command..."
  echo ""

  mas_apps=(
    935235287   # Encrypto
    497799835   # XCode
    407963104   # Pixelmator
    1176895641  # Spark Email
    1384080005  # Tweetbot 3
  )

  for app in ${mas_apps[@]};
  do
    mas install "$app"
  done
}
