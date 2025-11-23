export SXHKD_SHELL='/usr/bin/sh'
dunst &
# redshift &
dbus-update-activation-environment --systemd --all &
picom &
sxhkd &
# exec /home/havra/prog/bspwm/bspwm -d > ~/bspwm-debug.log
exec bspwm
