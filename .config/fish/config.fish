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
# bind "[1;2D" backward-bigword
# bind "[1;2C" forward-bigword

# check if bin/progs and bin/scripts exist otherwise create them
if not test -d $HOME/bin/progs
	mkdir -p $HOME/bin/progs
end

if not test -d $HOME/bin/scripts
	mkdir -p $HOME/bin/scripts
end

set toadd $(du --exclude='*git*' $HOME/bin/scripts | cut -f2) $(du --exclude='*git*' $HOME/.local/bin | cut -f2)

# check existance of maple and add it to path, in fish one cannot dump "No matches for wildcard" error so  double check is needed
if test -n "$(ls $HOME/bin/progs | grep maple)"
	# if it exists then add it to path
	set maplepath (find $HOME/bin/progs/maple* -maxdepth 1 -type d -name bin )
	if test -n "$maplepath"
		set toadd $toadd $maplepath
	end
end

# check existance of mathlab
set matlabpath $HOME/bin/progs/matlab24b/bin/glnxa64
if test -n "$matlabpath"
	set toadd $toadd $matlabpath
end

set stmcubepath $HOME/bin/progs/stmcube
if test -n "$stmcubepath"
	set toadd $toadd $stmcubepath
end


for entry in $toadd
	if not contains $entry $PATH
		set -x  PATH "$PATH:$entry"
	end
end


# set -x PATH $default_fish_path:(du --exclude='*git*' $HOME/bin/scripts | cut -f2 | tr '\n' ':')
set -x READER zathura
set -x EDITOR nvim
set -x BROWSER firefox
set -x TERMINAL st
set -x TEXINPUTS "::$HOME/dox/templates/::$HOME/dox/templates/bibliography::$HOME/dox/templates/images"

set -x TEXMFDIST 	"/usr/share/texmf-dist"
set -x TEXMFLOCAL 	"/usr/local/share/texmf:/usr/share/texmf"
set -x TEXMFSYSVAR 	"/var/lib/texmf"
set -x TEXMFSYSCONFIG 	"/etc/texmf"
set -x TEXMFHOME 	"~/texmf"
set -x TEXMFVAR 	"~/.texlive/texmf-var"
set -x TEXMFCONFIG 	"~/.texlive/texmf-config"
set -x TEXMFCACHE 	"$TEXMFSYSVAR;$TEXMFVAR"
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
		if test (tty) != /dev/tty1; and  test "--prefix--$(git rev-parse --show-toplevel 2>/dev/null)" != "--prefix--$HOME"
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

# if status is-interactive
#  dbus-update-activation-environment --systemd --all
# end

	# starts ssh agent on loggin into tty
source "$HOME/.config/fish/abbreviations.fish"
source "$HOME/.config/fish/startssh.fish"
source "$HOME/.config/fish/colorscheme.fish"

# Created by `pipx` on 2024-05-01 10:19:25
set PATH $PATH /home/havra/.local/bin
