#/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Not the root user! Try using \"sudo ${0}\"."
  exit 1
fi

case $1 in
-i)
  # Install
  cp me.superbear.nuistconnect.plist /Library/LaunchDaemons
  cp nuistconnect.sh /usr/local/bin
  launchctl load /Library/LaunchDaemons/me.superbear.nuistconnect.plist
  launchctl start me.superbear.nuistconnect
  ;;
-u)
  # Uninstall
  launchctl stop me.superbear.nuistconnect
  launchctl unload /Library/LaunchDaemons/me.superbear.nuistconnect.plist
  rm /Library/LaunchDaemons/me.superbear.nuistconnect.plist
  rm /usr/local/bin/nuistconnect.sh
  ;;
*)
  echo 'Please using "-i" to install. Or using "-u" to uninstall.'
  ;;
esac
