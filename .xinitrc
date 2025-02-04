export SXHKD_SHELL='/usr/bin/sh'
dunst &
sxhkd &
redshift &
dbus-update-activation-environment --systemd --all &
picom &
exec bspwm
