#!/bin/bash
triggerssid="i-NUIST"
username="guest"
domain="NUIST"
password="Z3Vlc3Q="
ssid=$(networksetup -getairportnetwork en0 | awk -F": " '{print $2}')

# Waiting for captive portal and kill it
# Try 10 times.
function killCaptive() {
  for ((i = 0; i < 10; i++)); do
    if ps aux | grep Captive | grep -qv grep; then
      killall "Captive Network Assistant"
      break
    fi
    sleep 1
  done
}

#echo "username=${username}&domain=${domain}&password=${password}"
#originpwd="guest"
#password=$(echo -n "${originpwd}" | base64)
if [ "$ssid" == "$triggerssid" ]; then
  killCaptive
  # Login
  curl -s -m 60 -d "username=${username}&domain=${domain}&password=${password}" http://10.255.255.13/index.php/index/login
fi
