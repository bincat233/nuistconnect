#!/bin/bash
triggerssid="i-NUIST"
username="guest"
domain="NUIST"
password="Z3Vlc3Q="
ssid=$(networksetup -getairportnetwork en0 | awk -F": " '{print $2}')

#echo "username=${username}&domain=${domain}&password=${password}"
#originpwd="guest"
#password=$(echo -n "${originpwd}" | base64)
if [ "$ssid" == "$triggerssid" ]; then
  # Waiting for network
  until ping -nq -c3 10.255.255.13; do
    sleep 1
  done

  # Login
  curl -vs -d "username=${username}&domain=${domain}&password=${password}" http://10.255.255.13/index.php/index/login

  # Waiting for captive portal and kill it
  until ps aux | grep Captive | grep -qv grep; do
    sleep 1
  done
  killall "Captive Network Assistant"
fi
