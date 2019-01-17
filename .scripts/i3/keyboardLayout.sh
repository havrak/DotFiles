#!/bin/sh

setxkbmap -option 'grp:win_space_toggle' -layout us,cz -variant ,qwerty
sleep 2
setxkbmap -option caps:escape
