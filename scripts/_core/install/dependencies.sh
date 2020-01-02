#!/usr/bin/env bash

install_zplug() {
  local zplug_url="https://github.com/zplug/zplug/archive/${ZPLUG_VERSION}.zip"
  local zplug_zip="$ZPLUG_PATH/zplug.zip"
  log::info "zplug not found, installing into ${ZPLUG_PATH}"

  if ! [ -d "$ZPLUG_PATH" ]; then mkdir "$ZPLUG_PATH" ; fi

  chronic wget -qO $zplug_zip $zplug_url
  unzip -q "$zplug_zip" -d "$ZPLUG_PATH"
  mv "$ZPLUG_PATH/zplug-$ZPLUG_VERSION" "$ZPLUG_HOME"
  rm "$zplug_zip"

  log::done "✔ Installed!"
}

install_dotman() {
  local url="https://github.com/erizocosmico/dotman/releases/download"
  local dotman_url

  log::info "dotman not found, installing into ${DOTMAN_BIN}"

  if ! [ -d "$DOTMAN_PATH" ]; then mkdir "$DOTMAN_PATH" ; fi
  if ! [ -d "$DOTMAN_HOME" ]; then mkdir "$DOTMAN_HOME" ; fi

  if [[ "$OSTYPE" == "darwin"* ]]; then
    dotman_url="${url}/${DOTMAN_VERSION}/dotman_darwin"
  else
    dotman_url="${url}/${DOTMAN_VERSION}/dotman_linux"
  fi

  chronic wget -qO $DOTMAN_BIN $dotman_url
  chmod +x "$DOTMAN_BIN"

  log::done "✔ Installed"
}

log::header "Checking dependencies..."

if ! [ -d "$ZPLUG_HOME" ] && ! [ -e "$ZPLUG_HOME/init.zsh" ] ; then
  install_zplug
else
  log::done "✔ zplug"
fi

if ! [ -e "$DOTMAN_BIN" ]; then
  install_dotman
else
  log::done "✔ dotman"
fi
