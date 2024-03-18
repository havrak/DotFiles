#!/usr/bin/fish

# java
export _JAVA_AWT_WM_NONREPARENTING=1
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

# use bat to color man pages
# if type -q bat
# 	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="less"
# end

# while using fish over ssh shift+Left/Right don't work by default
bind "[1;2D" backward-bigword
bind "[1;2C" forward-bigword

set toadd $(du --exclude='*git*' $HOME/bin/scripts | cut -f2)  $(dirname $(find $HOME/.arduino15/packages/esp32/tools/xtensa-esp32-elf-gcc/ -name 'xtensa-esp32-elf-addr2line' 2>/dev/null) 2>/dev/null)


for entry in $toadd
	if not contains $entry $PATH
		set -x  PATH "$PATH:$entry"
	end
end



# /opt/esp-idf/export.fish

# set -x PATH $default_fish_path:(du --exclude='*git*' $HOME/bin/scripts | cut -f2 | tr '\n' ':')
set -x READER zathura
set -x EDITOR nvim
set -x BROWSER firefox
set -x TERMINAL st
set -x TEXINPUTS "::$HOME/dox/templates/::$HOME/dox/templates/bibliography::$HOME/dox/templates/images"

function fish_greeting
end

set -g __fish_git_prompt_show_informative_status  1
set -g __fish_git_prompt_char_dirtystate ''
set -g __fish_git_prompt_char_cleanstate  ''
set -g __fish_git_prompt_char_invalidstate ''
set -g __fish_git_prompt_char_stagedstate ''
set -g __fish_git_prompt_char_stashstate '󰈻'


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
		if test (tty) != /dev/tty1
			printf (fish_git_prompt)
		end
	set_color red --bold
		printf ">"
	set_color normal

	# del key does not work properly by itself
	printf '\033[?1h\033=' >/dev/tty
end


function fish_user_key_bindings
	fzf_key_bindings
end

# starts ssh agent on loggin into tty
source "$HOME/.config/fish/abbreviations.fish"
source "$HOME/.config/fish/startssh.fish"
source "$HOME/.config/fish/colorscheme.fish"
