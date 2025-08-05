#!/bin/bash

### Start ###

echo "Executing."

# Get commit message from user
read -p "Enter message: " commit_message

### Copy files ###

rsync ~/.vimrc ~/Git/dotfiles/

rsync -r ~/.config/i3/ ~/Git/dotfiles/.config/

rsync ~/.Xresources ~/Git/dotfiles/

rsync -r ~/.icons ~/Git/dotfiles

rsync -r ~/.config/picom/ ~/Git/dotfiles/.config/

### Git ###

cd ~/Git/dotfiles/
git add .
git commit -m "$commit_message"
git push -u origin main

# Exit out of repository
cd ~

### Finish ###

echo "Done."
