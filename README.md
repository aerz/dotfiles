# dotfiles

<img src="img/ufetch.png" align="right" alt="fetch image" width="400">

- **OS**: [Arch Linux](https://archlinux.org)
- **WM**: [sway](https://github.com/swaywm/sway)
- **Bar**: [waybar](https://github.com/Alexays/Waybar)
- **Shell**: [Bash](https://www.gnu.org/software/bash/)
- **Terminal emulator**: [Alacritty](https://github.com/alacritty/alacritty)
- **Editor**: [Emacs](https://www.gnu.org/software/emacs/)
- **Icon theme**: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- **Color Scheme**: Based on [Min Tomorrow Theme](https://github.com/musm/min-tomorrow-theme)

# Details

## Software

| Package                                                                       | Description                                         |
| ----------------------------------------------------------------------------- | --------------------------------------------------- |
| [rofi](https://github.com/davatorium/rofi)                                    | Dmenu replacement                                   |
| [playerctl](https://github.com/altdesktop/playerctl)                          | Fetch metadata about what is being played           |
| [ponymix](https://github.com/falconindy/ponymix)                              | Pulseaudio frontend to control output/input devices |
| [yay](https://github.com/Jguer/yay)                                           | AUR helper                                          |
| [grimshot](https://github.com/OctopusET/sway-contrib)                         | Screenshot utility combines grim with slurp         |
| [swaylock](https://github.com/mortie/swaylock-effects)                        | swaylock with effects                               |
| [swayidle](https://github.com/swaywm/swayidle)                                | Idle manager doesn't care about media               |
| [imv](https://sr.ht/~exec64/imv/)                                             | Image viewer                                        |
| [zathura](https://pwmt.org/projects/zathura)                                  | Best document viewer                                |
| [gnome-keyring](https://archlinux.org/packages/extra/x86_64/gnome-keyring/)   | Save secrets safe, unlocks with Linux PAM           |
| [keepassxc](https://keepassxc.org)                                            | Portable secrets vault with agent integration       |

## Fonts

- [Inter](https://rsms.me/inter)
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com)
- [twemoji](https://github.com/twitter/twemoji). I like their flags.

## Wallpaper

My wallpaper is slightly edited, you can find it [here](img/wallpaper.jpg) and the [original](https://unsplash.com/photos/RRLb2zFzRK8) is by Timusic Photographso published on Unsplash.

# Installation

```shell
git clone https://github.com/aerz/dotfiles ~/.config/dotfiles
go get github.com/erizocosmico/dotman
cd ~/.config/dotfiles
dotman -config dotman.yaml
```

After you complete the basic installation, there are more topics covered in [docs](./docs).
