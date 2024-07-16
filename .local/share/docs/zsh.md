# Zsh

I chose Zsh over fish because of its large community, plugins, themes and
widgets (also because of past knowledge). However, I have found Zsh code to be a
bit
[hacky](https://github.com/zdharma-continuum/zinit/blob/d05a5301150909d8b386ebb974e1d1634740d65d/zinit.zsh#L1749-L1751)
as it always has been. I may consider [Fish](https://fishshell.com) in the
future or a shell like  [nushell](https://github.com/nushell/nushell) if it
makes things like that easier.

## Usage

> [!NOTE]
> This document is a note for my future self. Confirm that the purpose of this
> shell still makes sense in the functions it provides and its ux.

### fzf[^1]

- `ctrl+t`. Paste the selected file path(s) into the command line.
- `alt+c`. `cd` into the selected directory.
- `ctrl+r`. Paste the selected command from history into the command line.

### zoxide[^2]

- `cd`. Full replacement of shell cd builtin command.
- `cdi`. Open interactive selection (fzf).
- `cd foo<SPACE><TAB>`. Interactive completions (fzf).
- `cd foo`. Interactive selection (fzf).

### fzf-tab[^3]

It will show zsh completions using `fzf` when pressing tab. It must be the last
plugin to bin `^I` in order to keep the
[compatibility](https://github.com/Aloxaf/fzf-tab/#compatibility-with-other-plugins)
with others. You can use `bindkey -M main | grep 'fzf-tab-complete'` to check that it is properly seated.

- `ctrl+space`. Multi-selection in `fzf`.

### fzf-git[^4]

Provides a lot of fzf function bindings for git repositories. 

### navi[^5]

- `ctrl+g`. Find string in Navi cheat sheets. Replace with the snippet.

[^1]: https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
[^2]: https://github.com/ajeetdsouza/zoxide/blob/main/templates/zsh.txt
[^3]: https://github.com/Aloxaf/fzf-tab
[^4]: https://github.com/junegunn/fzf-git.sh#usage
[^5]: https://github.com/denisidoro/navi/blob/master/docs/installation.md#installing-the-shell-widget
