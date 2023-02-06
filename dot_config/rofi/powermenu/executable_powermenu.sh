#!/bin/bash

# small power menu using rofi, i3, systemd and pm-utils
# (last 3 dependencies are adjustable below)
# tostiheld, 2016

powermenu=~/.config/rofi/powermenu/dmenu.rasi

logout_command="swaymsg exit"
suspend_command="systemctl suspend"
poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
hibernate_command="systemctl hibernate"

# you can customise the rofi command all you want ...
rofi_command="rofi -config $powermenu"

options=$'suspend\nlogout\npoweroff\nreboot\nhibernate' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
