#!/bin/bash

### Start ###

echo "Executing."

### Copy files ###

rsync ~/.vimrc ~/Git/dotfiles/

rsync -r ~/.config/i3 ~/Git/dotfiles/.config/

rsync ~/.Xresources ~/Git/dotfiles/

rsync -r ~/.icons ~/Git/dotfiles/

rsync -r ~/.config/picom ~/Git/dotfiles/.config/

rsync -r ~/.config/polybar ~/Git/dotfiles/.config/

rsync -r ~/scripts ~/Git/dotfiles/

### Git ###

cd ~/Git/dotfiles/
git add .

git status

read -p "Enter message: " commit_message

git commit -m "$commit_message"
git push -u origin main

# Exit out of repository
cd ~

### Finish ###

echo "Done."
