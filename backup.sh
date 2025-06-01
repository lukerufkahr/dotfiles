#!/bin/bash

### Start ###

echo "Executing."

# Get commit message from user
read -p "Enter message: " commit_message

### Copy files ###

# Vim
cp -r ~/.vimrc ~/Git/dotfiles/

# Sway
cp -r ~/.config/sway/* ~/Git/dotfiles/.config/sway/

# Waybar
cp -r ~/.config/waybar/* ~/Git/dotfiles/.config/waybar/

# Foot
cp -r ~/.config/foot/* ~/Git/dotfiles/.config/foot/

# Mpd
cp -r ~/.config/mpd/* ~/Git/dotfiles/.config/mpd/

# Ncmpcpp
cp -r ~/.config/ncmpcpp/* ~/Git/dotfiles/.config/ncmpcpp/

# Qutebrowser
cp -r ~/.config/qutebrowser/* ~/Git/dotfiles/.config/qutebrowser/

# Ranger
cp -r ~/.config/ranger/* ~/Git/dotfiles/.config/ranger/

### Git ###

cd ~/Git/dotfiles/
git add .
git commit -m "$commit_message"
git push -u origin main

# Exit out of repository
cd ~

### Finish ###

echo "Done."
