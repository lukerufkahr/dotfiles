#!/bin/bash

### Start ###

echo "Executing."

# Get commit message from user
read -p "Enter message: " commit_message

### Copy files ###

rsync ~/.vimrc ~/Git/dotfiles/

rsync -r ~/.config/i3/ ~/Git/dotfiles/.config/i3/

rsync ~/.Xresources ~/Git/dotfiles/

rsync -r ~/.icons ~/Git/dotfiles

rsync -r ~/.config/picom/ ~/Git/dotfiles/.config/picom/

rsync -r ~/.config/polybar/ ~/Git/dotfiles/.config/polybar

### Git ###

cd ~/Git/dotfiles/
git add .
git commit -m "$commit_message"
git push -u origin main

# Exit out of repository
cd ~

### Finish ###

echo "Done."
