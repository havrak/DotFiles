#!/bin/sh

setxkbmap -option 'grp:sclk_toggle' -layout us,cz -variant qwerty
sleep 2
setxkbmap -option caps:escape
