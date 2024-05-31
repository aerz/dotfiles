# Audio

## Troubleshooting

### Device volume level is not restored after restarting when a greeter is installed

When using a greeter like [greetd](https://sr.ht/~kennylevinsen/greetd/),
the [PipeWire#Low_volume](https://wiki.archlinux.org/title/PipeWire#Low_volume)
workaround doesn't work. The `alsa-restore.service` restores the settings for
the first logged-in user.

This is why I included a copy/paste service to fix it, following these steps:

```shell
alsamixer
```

```shell
alsactl -f ~/.config/asound.state store
```

```shell
systemctl --user enable --now alsa-restore.service
```

**Related**

- [Restore volumes with PipeWire/WirePlumber](https://unix.stackexchange.com/questions/741808/restore-volumes-with-pipewire-wireplumber)
