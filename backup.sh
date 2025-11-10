#!/bin/bash

### Start ###

echo "Executing."

### Copy files ###

rsync ~/.xinitrc ~/Git/dotfiles

rsync ~/.vimrc ~/Git/dotfiles/

rsync -r ~/.config/sway ~/Git/dotfiles/.config/

rsync ~/.Xresources ~/Git/dotfiles/

rsync ~/.profile ~/Git/dotfiles

rsync -r ~/.icons ~/Git/dotfiles/

rsync -r ~/.config/waybar ~/Git/dotfiles/.config/

rsync -r ~/.config/tofi ~/Git/dotfiles/.config/

rsync -r ~/.config/systemd ~/Git/dotfiles/.config/

rsync -r ~/.config/foot ~/Git/dotfiles/.config/

rsync -r ~/scripts ~/Git/dotfiles/

rsync -r ~/.config/i3 ~/Git/dotfiles/.config/

rsync -r ~/.config/polybar ~/Git/dotfiles/.config/

rsync -r ~/.config/picom ~/Git/dotfiles/.config/

rsync -r ~/.config/rofi ~/Git/dotfiles/.config/

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
