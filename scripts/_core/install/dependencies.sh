#!/usr/bin/env bash

log::header "Checking dependencies..."

if ! [ -d "${DEPENDENCIES_PATH}/zplug-${ZPLUG_VERSION}" ]; then
  zplug_download_url="https://github.com/zplug/zplug/archive/${ZPLUG_VERSION}.zip"
  zplug_zip_file="zplug-${ZPLUG_VERSION}.zip"
  zplug_folder="zplug-${ZPLUG_VERSION}"

  log::info "zplug not found, installing into ${DEPENDENCIES_PATH}/$zplug_folder"

  run_chronic \
    "wget -O $DEPENDENCIES_PATH/$zplug_zip_file $zplug_download_url" \
    "unzip $DEPENDENCIES_PATH/$zplug_zip_file -d $DEPENDENCIES_PATH"
  rm "${DEPENDENCIES_PATH}/${zplug_zip_file}"

  log::info "✔ Installed!"
elif [ "$DEPENDENCIES_PATH" == "$ZPLUG_HOME" ]; then
  log::info "Updating zplug plugins"
  _zsh=$(which zsh)
  $_zsh -i -c "zplug update"
else
  log::info "✔ zplug"
fi

if ! [ -e "$DOTMAN_BIN" ]; then
  log::info "dotman not found, installing into ${DOTMAN_BIN}"
  dotman_url="https://github.com/erizocosmico/dotman/releases/download/${DOTMAN_VERSION}/dotman_darwin"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    run_chronic \
      "wget -O $DOTMAN_BIN $dotman_url" \
      "chmod +x $DOTMAN_BIN"
  fi

  log::info "✔ Installed"
else
  log::info "✔ dotman"
fi
