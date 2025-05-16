export SXHKD_SHELL='/usr/bin/sh'
dunst &
redshift &
dbus-update-activation-environment --systemd --all &
picom &
sxhkd &
ibus-daemon -drx &
exec bspwm
# exec herbstluftwm
