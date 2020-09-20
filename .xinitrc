dunst &
sxhkd &
redshift &
mpd &
setsid -f http-server $HOME/web/homepage 4444 &
export SXHKD_SHELL='/usr/bin/sh'
transmission-daemon &
exec bspwm
