self::install::zim() {
  local zim_url="https://github.com/zimfw/zimfw/releases/download/v1.1.1/zimfw.zsh"
  local zim_path="$HOME/.zim"

  log --header "Zim"

  if utils::check_command 'zmodule'; then
    if utils::check_command 'zimfw'; then
      log "Zim is not installed. Installing"

      [ ! -d "$zim_path" ] && \
        log "$zim_path Doesn't exist, creating folder" && \
        mkdir "$zim_path"

      log "Downloading Zim"
      wget -qO "$zim_path/zimfw.zsh" "$zim_url"

      log "Installing Zim"
      zsh -c "source $zim_path/zimfw.zsh install"
    fi
  fi

  log --success "Iinstalled"
}

self::install::docopts() {
  local -r docopts_url="https://github.com/aerz/docopts.git"
  local -r docopts_bin="$DOTFILES_BIN_PATH/docopts/docopts"

  log --header "Docopts"

  [ ! -d "$DOTFILES_BIN_PATH" ] && mkdir -v "$DOTFILES_BIN_PATH"
  if [ ! -f "$docopts_bin" ]; then
    git clone "$docopts_url" "$DOTFILES_BIN_PATH/docopts"
    $DOTFILES_BIN_PATH/docopts/get_docopts.sh
  fi

  log --success "Installed"
}

self::install::zsh() {
  log --header "Checking the default shell"

  echo $SHELL | grep "zsh" &> /dev/null
  [[ $? -eq 1 ]] &&
    log "Changing your default shell to zsh" &&
    chsh -s $(which zsh)

  log --success "zsh is the default shell"
}

self::install::last_login() {
  local hushl="$HOME/.hushlogin"

  log --header "Checking hushlogin file"

  [ ! -f "$hushl" ] &&
    touch "$hushl" &&
    log --success "Created $hushl"
}
