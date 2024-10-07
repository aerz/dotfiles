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
- `cd foo<TAB>`. Interactive selection (fzf) or auto-completion.

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

## Commands

### Debug shell load time

```shell
# .zshrc
zmodload zsh/zprof # first line
zprof              # end
```

```shell
# how much time takes to load all configs?
for i in {1..10}; do time zsh -i -c exit; done
#zsh -i -c exit  0.04s user 0.02s system 99% cpu 0.054 total
#...
```

```shell
# https://github.com/sharkdp/hyperfine
hyperfine --warmup 1 'zsh -i -c exit'
hyperfine --warmup 2 'fish -i -c exit' 'zsh -i -c exit'
```

## Resources

### Plugins

- [zsh-users](https://github.com/zsh-users)
- [ohmyzsh/plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
- [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [github/zsh-plugins](https://github.com/topics/zsh-plugins)

### Completions

- [zsh-users/zsh-completions-howto](https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org)
- [zsh docs/20.6 utility functions](https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Completion-Functions)
- [apple/zsh-completions](https://github.com/apple-oss-distributions/zsh/tree/main/zsh/Completion)
- [ohmyzsh/plguins/completions](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins). Plugins includes missing completions for known tools.
- [zsh-more-completions](https://github.com/MenkeTechnologies/zsh-more-completions)

[^1]: https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
[^2]: https://github.com/ajeetdsouza/zoxide/blob/main/templates/zsh.txt
[^3]: https://github.com/Aloxaf/fzf-tab
[^4]: https://github.com/junegunn/fzf-git.sh#usage
[^5]: https://github.com/denisidoro/navi/blob/master/docs/installation.md#installing-the-shell-widget
