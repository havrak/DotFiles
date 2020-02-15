#!/bin/sh

text=$(cat $HOME/.scripts/files/clipboardText | rofi -dmenu -p "Choose text to save to clipboard")

echo $text | xclip -selection clipboard
echo $text | xclip
