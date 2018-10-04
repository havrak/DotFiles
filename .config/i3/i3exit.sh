#!/bin/bash
############################################################
# 
############################################################

function lock {
	#i3lock -ti /home/havra/Pictures/resized2.png
	./.config/i3/lock.sh 0
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    poweroff)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|poweroff}"
        exit 2
esac

exit 0
