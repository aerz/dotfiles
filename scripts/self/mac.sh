self::install::mac::install_brew() {
  log --header "Brew"

  if ! utils::check_command 'brew'; then
    log "Brew is not detected. Installing"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  log --success "Installed"
}

self::install::mac::brew_bundle() {
  log --header "Installing utils with brew"
  brew bundle --file "$DOTFILES_PATH/mac/brew/brewfile_install"
}

self::install::mac::init() {
  log --header "Installing dotfiles for macOS"
  self::install::mac::install_brew
  self::install::mac::brew_bundle
}
