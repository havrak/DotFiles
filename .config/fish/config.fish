#!/usr/bin/fish

# java
export _JAVA_AWT_WM_NONREPARENTING=1

set PATH (du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':') $PATH
set -x READER zathura
set -x EDITOR nvim
set -x BROWSER firefor
set -x TERMINAL st

function fish_greeting
end


function fish_prompt
	set_color yellow
		printf "%s" "$USER"
	set_color green
		printf "@"
	set_color magenta
		printf "%s" "$hostname"
	set_color green
		printf ":"
	set_color blue --bold
		printf (basename $PWD)
	set_color red --bold
		printf " >"
	set_color normal

	# del key does not work properly by itself
	printf '\033[?1h\033=' >/dev/tty
end

abbr p "yay"
abbr v "nvim"
abbr orphans "yay -Qqtd"
abbr sr "sudo ranger"
abbr r "ranger"
abbr n "neomutt"
abbr sv "sudoedit"
abbr grp "git remote | xargs -L1 git push --all"
abbr g "git"
abbr mus "ncmpcpp"
abbr z "zathura --fork"
abbr s "sensors"
abbr yt "youtube-dl"
abbr fan "sudo echo level | sudo tee /proc/acpi/ibm/fan"
abbr sc "sudo systemctl"
abbr pyserver "python3 -m http.server"
abbr netres "sudo modprobe -r e1000e && sudo modprobe e1000e"
abbr prm "sudo rm -rf /var/cache/pacman/"
abbr smloadr "smloadr -p /home/havra/dw/deezloader/ -q FLAC"

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

fish_vi_key_bindings

