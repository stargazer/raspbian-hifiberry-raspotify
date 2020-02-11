#!/bin/bash

SERVICE="librespot.service"
REGEX="ERROR"

journalctl -f -n 0 -u "$SERVICE" |
while read line
do
  match=$(echo "$line" | grep -E "$REGEX")
  if [[ $match ]];
    then sudo reboot
  fi
done
