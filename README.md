# dotfiles

## Install

Be sure you have installed the essential macOS tools:

```sh
xcode-select --install
```

And then, you can use the auto installer to clone the repo and configure the dot
command:
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/aerz/dotfiles/master/install)"
```

## Manual settings

- System Preferences > Energy Saver
  - [ ] Wake for Ethernet network access
  - [ ] Start up automatically after a power failure
  - [ ] Enable Power Nap

- System Preferences > Bluetooth > Advanced
  - [ ] Allow Bluetooth devices to wake this computer

- System Preferences > Energy Saver
  - [x] Prevent computer from sleeping automatically when the display is off

## License

See [license](https://github.com/aerz/dotfiles/blob/master/LICENSE) for more information.
