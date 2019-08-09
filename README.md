### Raspbian, HiFiBerry, raspotify

Installs and configures [raspotify](https://github.com/dtcooper/raspotify) on a [Raspberry Pi](https://www.raspberrypi.org/) running the [Raspbian](https://raspbian.org/) distribution with a [HifiBerry](https://www.hifiberry.com/) sound card.

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
