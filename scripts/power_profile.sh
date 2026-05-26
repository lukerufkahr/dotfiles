#!/bin/bash

charging="Charging"
discharging="Discharging"
full="Full"

last_profile=""
while true; do
	profile=$(cat /sys/class/power_supply/BAT0/status)
	
	$(pkill -SIGRTMIN+14 i3blocks)

	if [[ "$profile" != "$last_profile" ]]; then
			if [[ "$profile" == "$charging" ]]; then
					$(powerprofilesctl set performance)
			fi
			if [[ "$profile" == "$full" ]]; then
					$(powerprofilesctl set performance)
			fi
			if [[ "$profile" == "$discharging" ]]; then
					$(powerprofilesctl set power-saver)
			fi
			$(pkill -SIGRTMIN+12 i3blocks)
			$(pkill -SIGRTMIN+11 i3blocks)
			last_profile=$profile
	fi
done
