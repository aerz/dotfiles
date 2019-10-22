#!/bin/bash

#######################################
# Generate new files with the brew apps
# and brew cask apps installed on your
# computer
# Globals:
#   DOTFILES_DIR
#######################################
update_apps() {
  echo "Be careful! You will replace your old app list to a new one, after that, you'll need make a new commit to keep the changes"
  read -r -p "Are you sure to continue? (Y/n) " answer
  
  if [[ $answer =~ (y|yes|Y) ]]; then
    echo "Creating brew app list..."
    brew list > "${DOTFILES_DIR}/brew/brew_apps"

    echo "Creating brew cask app list..."
    brew cask list > "${DOTFILES_DIR}/brew/brew_cask_apps"

    echo ""
    echo "Done!"

    exit 0
  fi

  echo ""
  echo "Operation cancelled!"

  exit 0
}
