symlinks::utils::ln() {
  local source="$1"
  local target="$2"

  core::log "$(ln -sfv "$source" "$target")"
}
