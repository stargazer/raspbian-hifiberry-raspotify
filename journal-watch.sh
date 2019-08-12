#!/bin/bash

SERVICE="raspotify.service"
REGEX="ERROR"

journalctl -f -n 0 -u "$SERVICE" |
while read line
do 
  if [[ "$line" =~ "$REGEX" ]]; then
    sudo reboot
  fi
done
