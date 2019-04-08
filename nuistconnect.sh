#!/bin/bash
triggerssid="i-NUIST"
ssid=$(networksetup -getairportnetwork en0 | awk -F": " '{print $2}')
username="guest"
domain="NUIST"
password="Z3Vlc3Q="

#echo "username=${username}&domain=${domain}&password=${password}"
#originpwd="guest"
#password=$(echo -n "${originpwd}" | base64)
echo ${password}
if [ "$ssid" == "$triggerssid" ]; then
  curl -m 20 -s -d "username=${username}&domain=${domain}&password=${password}" http://10.255.255.13/index.php/index/login
fi
