#!/usr/bin/fish

# java
export _JAVA_AWT_WM_NONREPARENTING=1

# use bat to color man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

set PATH $PATH (du "$HOME/bin" | cut -f2 | tr '\n' ':')
set -x READER zathura
set -x EDITOR nvim
set -x BROWSER firefox
set -x TERMINAL st

function fish_greeting
end

function fish_prompt
  set -l last_status $status
	set_color yellow
		printf "%s " "$last_status"
  set_color yellow
		printf "%s" "$USER"
	set_color green
		printf "@"
	set_color magenta --bold
		printf "%s" "$hostname"
	set_color green
		printf ":"
	set_color blue
		printf (basename $PWD)
	set_color red --bold
		printf ">"
	set_color normal

	# del key does not work properly by itself
	printf '\033[?1h\033=' >/dev/tty
end


function fish_user_key_bindings
	fzf_key_bindings
end

bind \cg fzf-file-edit

if bind -M insert > /dev/null 2>&1
	bind -M insert \cg fzf-file-edit
end


# starts ssh agent on loggin into tty
source "$HOME/.config/fish/abbreviations.fish"
source "$HOME/.config/fish/startssh.fish"
source "$HOME/.config/fish/colorscheme.fish"
