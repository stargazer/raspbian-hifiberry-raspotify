setup: \
	disable-onboard-soundcard \
	install-raspotify \
	configure-alsa \
	disable-raspotify-service \
	install-cli-scripts \
	enable-custom-services

disable-onboard-soundcard:
	sudo touch /etc/modprobe.d/soundcard-blacklist.conf
	echo 'blacklist snd_bcm2835' | sudo tee /etc/modprobe.d/soundcard-blacklist.conf

install-raspotify:
	curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

configure-alsa:
	sudo cp -f `pwd`/asound.conf /etc/.

disable-raspotify-service:
	sudo systemctl disable raspotify 2&>1

install-cli-scripts:
	sudo cp -f `pwd`/raspotify.sh /usr/local/bin/.
	sudo chmod a+x /usr/local/bin/raspotify.sh

	sudo cp -f `pwd`/journal-watch.sh /usr/local/bin/.
	sudo chmod a+x /usr/local/bin/journal-watch.sh

enable-custom-services:
	sudo cp -f `pwd`/raspotify.service /lib/systemd/system/raspotify.service
	sudo chmod 644 /lib/systemd/system/raspotify.service

	sudo cp -f `pwd`/journal-watch.service /lib/systemd/system/journal-watch.service
	sudo chmod 644 /lib/systemd/system/journal-watch.service

	sudo systemctl daemon-reload
	sudo systemctl start raspotify
	sudo systemctl enable raspotify
	sudo systemctl start journal-watch
	sudo systemctl enable journal-watch
