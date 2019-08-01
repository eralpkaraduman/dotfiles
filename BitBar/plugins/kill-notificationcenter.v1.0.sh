#!/bin/bash

# <bitbar.title>Fix Mojave Transparent Notifications</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Eralp Karaduman</bitbar.author>
# <bitbar.author.github>eralpkaraduman</bitbar.author.github>
# <bitbar.desc>This plugin fixes mojave transparent notifications.</bitbar.desc>
# <bitbar.image>https://cloud.githubusercontent.com/assets/53064/12120421/e515718c-b39e-11e5-830b-bebe1c6445fc.png</bitbar.image>
# <bitbar.dependencies></bitbar.dependencies>

if [ "$1" = 'killnc' ]; then
  killall NotificationCenter
  exit
fi

echo "💀"
echo '---'
echo "Kill NotificationCenter | bash='$0' param1=killnc terminal=false"
