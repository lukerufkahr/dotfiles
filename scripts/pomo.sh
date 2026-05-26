#!/bin/bash
for i in {1..4}; do
	printf "\rStarting in $((4 - i))"
	sleep 1
done
while true; do
	printf "\rTime to work."
	for i in {1..1800}; do
		sleep 1
		printf "\r$((i/60))/30 minutes"
	done
	printf "\rTime to take a break."
	zenity --error --text "Take a break." --title "Break Time"
	for i in {1..300}; do
		sleep 1
		printf "\r $((i/60))/5 minutes"
	done
	printf "\rBreak over!"
	zenity --info --text "Back to work." --title "Break Over"
done
