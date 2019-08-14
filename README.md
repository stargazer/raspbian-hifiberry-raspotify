### Raspbian, HiFiBerry, librespot

Installs and configures [librespot](https://github.com/librespot-org/librespot) on a [Raspberry Pi](https://www.raspberrypi.org/) running the [Raspbian](https://raspbian.org/) distribution with a [HifiBerry](https://www.hifiberry.com/) sound card.

### How to install

```sh
git clone https://github.com/stargazer/raspbian-hifiberry-librespot.git
cd raspbian-hifiberry-librespot
make setup
```

### Start/stop service

```sh
sudo systemctl start librespot
sudo systemctl stop librespot
```

### Follow log

```sh
journalctl -n 100 -f -u librespot.service
```
