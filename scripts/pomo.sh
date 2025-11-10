#!/bin/bash

while true; do
	for i in {1..1800}; do
		sleep 1
		printf "\r $((i/60))/30 minutes"
	done
	zenity --error --text "Take a break." --title "Break Time"
	for i in {1..300}; do
		sleep 1
		printf "\r $((i/60))/5 minutes"
	done
	zenity --info --text "Back to work." --title "Break Over"
done
