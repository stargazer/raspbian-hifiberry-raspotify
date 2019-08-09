setup: \
	disable-onboard-soundcard \
	install-raspotify \
	configure-alsa \
	disable-raspotify-service \
	install-cli-script \
	enable-custom-service

disable-onboard-soundcard:
	sudo touch /etc/modprobe.d/soundcard-blacklist.conf
	echo 'blacklist snd_bcm2835' | sudo tee /etc/modprobe.d/soundcard-blacklist.conf

install-raspotify:
	curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

configure-alsa:
	sudo ln -sf `pwd`/asound.conf /etc/.

disable-raspotify-service:
	sudo systemctl disable raspotify
	sudo rm /lib/systemd/system/raspotify.service

install-cli-script:
	sudo ln -sf `pwd`/raspotify.sh /usr/local/bin/.
	chmod a+x /usr/local/bin/raspotify.sh

enable-custom-service:
	sudo ln -sf `pwd`/raspotify.service /lib/systemd/system/raspotify.service
	sudo chmod 644 /lib/systemd/system/raspotify.service
	sudo systemctl start raspotify
	sudo systemctl enable raspotify
