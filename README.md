# Dotfiles

Personal configuration for macOS software development setup.

## Install
```sh
xcode-select --install
git clone https://github.com/Aerz/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
```

## Manual settings
I didn't find the way to modify it :(

- Disable: System Preferences > Energy Saver
  - Wake for Ethernet network access
  - Start up automatically after a power failure
  - Enable Power Nap

- Enable: System Preferences > Energy Saver
  - Prevent computer from sleeping automatically when the display is off

## Backups
There are some scripts on the project that allows you to create configuration backups.

### Dock apps
Extract the icons are you using on your Dock and creates a script to run for restore it.

```sh
# Create the backup first
./macos/create_backup_dock_apps
```

```sh
# Restore the dock icons
./macos/backup_dock_apps
```

### VSCode Extensions

```sh
# Save the installed extensions
./vscode/save_extensions
```

```sh
# Install the extensions using extensions.vsc files
./vscode/install_extensions
```
