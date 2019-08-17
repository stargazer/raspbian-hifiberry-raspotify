### Raspbian, HiFiBerry, librespot

Installs and configures [librespot](https://github.com/librespot-org/librespot) on a [Raspberry Pi](https://www.raspberrypi.org/) running the [Raspbian](https://raspbian.org/) distribution with a [HifiBerry](https://www.hifiberry.com/) sound card.

As soon as `librespot` starts, an extra service called `journal-watch` is ran.
`journal-watch` parses `librespot`'s log and restarts it when any
ERROR-level messages appear.
This is the only reasonable way to deal with `librespot`'s glitches and most
notably the one described [here](https://github.com/librespot-org/librespot/issues/241).
[This comment](https://github.com/librespot-org/librespot/issues/134#issuecomment-441499150) actually suggests
a cronjob-based solution. I think a service-based solution is way better.

I'd like to emphasize that if you often get *Connection reset by peer" errors,
there's is probably something wrong with your network. I had the same for way
too long time. I had tried all solutions, and installed various different
versiond of `librespot` and other related tools. Nothing solved it. It turned out that once I
switched from using my raspberrypi's ethernet connection to wifi, I never
got it again. Go figure!

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
