setup: \
	disable-onboard-soundcard \
	install-raspotify \
	configure-alsa \
	disable-raspotify-daemon \
	install-cli-script 

disable-onboard-soundcard:
	sudo touch /etc/modprobe.d/soundcard-blacklist.conf
	echo 'blacklist snd_bcm2835' | sudo tee /etc/modprobe.d/soundcard-blacklist.conf

install-raspotify:
	curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

configure-alsa:
	sudo ln -sf `pwd`/asoundrc ${HOME}/.asoundrc

disable-raspotify-daemon:
	sudo systemctl disable raspotify

install-cli-script:
	ln -sf `pwd`/run.sh ${HOME}/.
	chmod a+x ${HOME}/run.sh
