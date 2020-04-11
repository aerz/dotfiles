#
# Interactive search for manual pages
#
fman() {
  # macos
  man -k . | fzf --prompt='Man> ' | awk '{print $1}' | cut -d '(' -f 1 | xargs man
  # gnu
  # man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}
