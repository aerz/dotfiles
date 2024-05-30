# Sway

## Installation

There are few packages required to run `sway`.

```shell
pacman -S autotiling-rs
```

```shell
yay -S sway-services-git swaylock-effects
```

## Configuration

Because I run sway using systemd units, the custom environment from `~/.bash_profile` is not propagated to sway. However, you can solve this by configuring two locations.

- `sway-services` uses a custom `env` file at `~/.config/sway/env` which [loads](https://github.com/xdbob/sway-services/blob/e3d9b8b390dc12224bdca23a0eb78265c824a360/systemd/sway.service#L13) in their systemd units included in the library.
- `systemd` allows loading user configuration for user services from `~/.config/environment.d/*.conf*`. See [documentation](https://www.freedesktop.org/software/systemd/man/latest/environment.d.html). 

## References

- https://github.com/xdbob/sway-services
- https://github.com/mortie/swaylock-effects
- https://github.com/OctopusET/sway-contrib
- https://arewewaylandyet.com
