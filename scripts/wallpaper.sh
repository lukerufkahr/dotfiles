#!/bin/bash

while true; do
	feh --bg-fill --randomize ~/Pictures/wallpapers/*
	for i in {1..900}; do
			printf "\rChanging wallpaper in $((900-i)) seconds."
		sleep 1
	done
done
