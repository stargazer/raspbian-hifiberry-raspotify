KERNEL_MODULES_DIR=/etc/modprobe.d
BIN_DIR=/usr/local/bin
SERVICE_DIR=/lib/systemd/system
CARGO_DIR=/home/pi/.cargo/bin
LIBRESPOT_DIR=${PWD}/librespot/target/release

setup: \
	disable-onboard-soundcard \
	configure-alsa \
	install-cargo \
	install-librespot \
	install-librespot-service

disable-onboard-soundcard:
	sudo touch ${KERNEL_MODULES_DIR}/blacklist-onboard-soundcard.conf
	echo 'blacklist snd_bcm2835' | sudo tee ${KERNEL_MODULES_DIR}/blacklist-onboard-soundcard.conf

configure-alsa:
	sudo cp -f `pwd`/asound.conf /etc/.

install-cargo:
	curl https://sh.rustup.rs -sSf | sh

install-librespot:
	sudo apt-get install -y build-essential libasound2-dev
	git clone https://github.com/librespot-org/librespot.git
	${CARGO_DIR}/cargo build --manifest-path=`pwd`/librespot/Cargo.toml --release
	sudo cp -f ${LIBRESPOT_DIR}/librespot ${BIN_DIR}/.

install-librespot-service:
	sudo cp -f `pwd`/librespot.service ${SERVICE_DIR}/librespot.service
	sudo chmod 644 ${SERVICE_DIR}/librespot.service
	sudo systemctl daemon-reload
	sudo systemctl restart librespot
	sudo systemctl enable librespot
