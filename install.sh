#/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Not the root user! Try using \"sudo ${0}\"."
  exit 1
fi

basepath=$(
  cd $(dirname $0)
  pwd
)
case $1 in
-i)
  # Install
  cp $basepath/me.superbear.nuistconnect.plist /Library/LaunchAgents && echo 'Move plist file success.'
  cp $basepath/nuistconnect.sh /usr/local/bin && echo 'Move script success.'
  launchctl load /Library/LaunchAgents/me.superbear.nuistconnect.plist && echo 'Daemon loaded.'
  launchctl start me.superbear.nuistconnect && echo 'Daemon started.'
  ;;
-u)
  # Uninstall
  launchctl stop me.superbear.nuistconnect
  launchctl unload /Library/LaunchAgents/me.superbear.nuistconnect.plist
  rm /Library/LaunchAgents/me.superbear.nuistconnect.plist
  rm /usr/local/bin/nuistconnect.sh
  echo "success!"
  ;;
*)
  echo 'Please using "-i" to install. Or using "-u" to uninstall.'
  ;;
esac
