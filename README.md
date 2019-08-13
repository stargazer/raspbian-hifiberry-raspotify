### Raspbian, HiFiBerry, raspotify

Installs and configures [raspotify](https://github.com/dtcooper/raspotify) on a [Raspberry Pi](https://www.raspberrypi.org/) running the [Raspbian](https://raspbian.org/) distribution with a [HifiBerry](https://www.hifiberry.com/) sound card.

The idea is to install a custom `raspotify` systemd service, running a set of
hardcoded parameters. 

As soon as `raspotify` starts, an extra service called `journal-watch` is ran. 
`journal-watch` parses `raspotify`'s log and restarts `raspotify` whenever any
ERROR-level messages appear. This is the only way I could deal with `librespot`'s glitches and most
notably the one described [here](https://github.com/librespot-org/librespot/issues/241).

### How to install

```sh
git clone https://github.com/stargazer/raspbian-hifiberry-raspotify.git
cd raspbian-hifiberry-raspotify
make setup
```

### Start/stop service

```sh
sudo systemctl start raspotify
sudo systemctl stop raspotify
```

### Follow log

```sh
sudo tail -f /var/log/syslog
```
