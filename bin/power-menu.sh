#!/bin/bash

# small power menu using rofi, openbox, systemd and pm-utils
# (last 3 dependencies are adjustable below)
# tostiheld, 2016

Power_command="systemctl poweroff"
Reboot_command="systemctl reboot"
Exit_command="openbox --exit"
Hibernate_command="systemctl hibernate"
Suspend_command="systemctl suspend"
#Lock_command=""
# you can customise the rofi command all you want ...
rofi_command="rofi -theme .config/rofi/themes/slate_power.rasi -width 10 -location 4 -hide-scrollbar -padding 0 -lines 5 "

options=$'Power\nReboot\nExit\nHibernate\nSleep' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -i -dmenu -p "")_command"

