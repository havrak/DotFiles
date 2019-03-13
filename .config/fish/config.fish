#!/usr/bin/fish

set PATH (du "$HOME/.scripts/" | cut -f2 | tr '\n' ':') $PATH
fish_vi_key_bindings
function fish_mode_prompt
end
function fish_greeting
end
function fish_prompt
	set_color red --bold
	printf "["
	set_color yellow
	printf "%s" "$USER"
	set_color green
	printf "@"
	set_color blue
	printf "%s" "$hostname"
	set_color magenta
	printf " "
	printf (basename $PWD)
	set_color red
	printf "]"
	set_color normal
end

abbr p "yaourt"
abbr v "nvim"
abbr orphans "yaourt -Qqtd"
abbr sr "sudo ranger"
abbr r "ranger"
abbr c "clear"
abbr sv "sudoedit"
abbr grp "git remote | xargs -L1 git push --all"
abbr g "git"
abbr music "ncmpcpp"
abbr z "zathura --fork"
abbr s "sxiv"
abbr java8jar "/usr/lib/jvm/java-8-jdk/jre/bin/java -jar"
abbr java8 "/usr/lib/jvm/java-8-jdk/jre/bin/java"

