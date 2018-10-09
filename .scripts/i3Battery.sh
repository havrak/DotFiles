#!/bin/sh

INFO="$(acpi -b)"
tmp=${INFO#*:}

notify-send "${tmp}"
