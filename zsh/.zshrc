DOTFILES_PATH="$HOME/dotfiles"

# init shell
source $DOTFILES_PATH/zsh/init.zsh

# run zplug
source $ZPLUG_HOME/init.zsh

# theme
zplug "geometry-zsh/geometry"

# zsh enhacements
zplug "zsh-users/zsh-syntax-highlighting", \
    defer:2

zplug "zsh-users/zsh-autosuggestions"

# commands
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1
# use fzf zsh completions
zplug "junegunn/fzf", use:"shell/*.zsh"

zplug "Aloxaf/fzf-tab", use:"fzf-tab.zsh"

zplug "agkozak/zsh-z"

zplug "b4b4r07/enhancd", use:init.sh

# install plugins wether needed
zplug_check_plugins

# source plugins and add commands to $PATH
zplug load
