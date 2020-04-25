#!/usr/bin/fish


set PATH (du "$HOME/.scripts/" | cut -f2 | tr '\n' ':') $PATH
set -x READER zathura
set -x EDITOR nvim
set -x BROWSER firefox

function fish_mode_prompt
end
function fish_greeting
end
function fish_prompt
#	set_color yellow --bold
#	printf "%s" "$USER"
#	set_color green
#	printf "@"
#	set_color blue
#	printf "%s" "$hostname"
#	set_color magenta
#	printf ":"
#	printf (basename $PWD)
#	set_color red
#	printf "-"
#	printf ">"
	set_color blue --bold
	printf (basename $PWD)
	set_color red --bold
	printf " >"
	set_color normal
	# del key does not work properly by itself
	printf '\033[?1h\033=' >/dev/tty
end

function compgen --description 'Print a list of documented fish commands'
    bash -c "compgen $argv"
end

abbr p "yaourt"
abbr v "nvim"
abbr orphans "yaourt -Qqtd"
abbr sr "sudo ranger"
abbr r "ranger"
abbr n "neomutt"
abbr sv "sudoedit"
abbr grp "git remote | xargs -L1 git push --all"
abbr g "git"
abbr music "ncmpcpp"
abbr z "zathura --fork"
abbr s "sensors"
abbr java "/usr/lib/jvm/java-8-jdk/jre/bin/java"
abbr yt "youtube-dl"
abbr fan "sudo echo level | sudo tee /proc/acpi/ibm/fan"
abbr sc "sudo systemctl"
abbr pyserver "python3 -m http.server"
abbr mpvol "mpv --input-ipc-server=/tmp/mpvsoc(date +%s) -quiet"
abbr netres "sudo modprobe -r e1000e && sudo modprobe e1000e"
abbr prm "sudo rm -rf /var/cache/pacman/"

function fzfdircd
	cd (dirname (locate home media | fzf -i -e))
end

function fzfevrycd
	cd (dirname (locate / | fzf -i -e))
end

function fzffilecd
	cd (dirname (find ~/.config ~/.local ~/.scripts ~/* -type f | fzf -i -e))
end

function fzfbookcd
	cd (dirname (find ~/dox/Bookshelf -type f | fzf -i -e))
end

function fzffileedit
	find ~/.config ~/.local ~/.scripts ~/* -type f | fzf -i -e | xargs -r $EDITOR
end

function ramuse
	ps axo rss,comm,pid \
                | awk '{ proc_list[$2]++; proc_list[$2 "," 1] += $1; } \
                END { for (proc in proc_list) { printf("%d\t%s\n", \
                proc_list[proc "," 1],proc); }}' | sort -n | tail -n 10 | sort -rn \
                | awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
end

# Start X at login
#if status is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx -- -keeptty
#    end
#end

