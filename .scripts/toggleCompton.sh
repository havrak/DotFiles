#!/bin/sh

TOGGLE=$HOME/.scripts/.toggleTmp

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    killall compton
else
    rm $TOGGLE
    compton -b
fi
