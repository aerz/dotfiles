log::error() {
  echo -e "${BOLD_RED}==> ${1}${NO_COLOR}"
}

log::info() {
  echo -e "${BLUE}==> ${NO_COLOR}${1}"
}

log::success() {
  echo -e "${GREEN}==> [✓] ${NO_COLOR}${1}"
}

log::header() {
  echo -e "${BLUE}==> ${NO_COLOR}${BOLD_WHITE}${1}${NO_COLOR}"
}

log() {
  local opt="$1"
  local message="$2"

  # when no option is defined, will use --info as default
  [[ "$opt" != "--"* ]] && message="$opt" && opt="--info"

  local _opt=$(echo "$opt" | tr -d "-")
  log::$_opt "$message"
}
