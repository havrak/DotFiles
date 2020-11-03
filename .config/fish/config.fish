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
		printf " >"
	set_color normal

	# del key does not work properly by itself
	printf '\033[?1h\033=' >/dev/tty
end

abbr v 				"nvim"
abbr vim 			"nvim"
abbr sr 			"sudo ranger"
abbr r 				"ranger"
abbr n 				"neomutt"
abbr sv 			"sudoedit"
abbr mus 			"ncmpcpp"
abbr z 				"zathura --fork"
abbr s 				"sensors"
abbr yt 			"youtube-dl"
abbr SS 			"sudo systemctl"
abbr pyserver "python3 -m http.server"
abbr netres 	"sudo modprobe -r e1000e && sudo modprobe e1000e"
abbr smloadr 	"smloadr -p /home/havra/dw/deezloader/ -q FLAC"
abbr cp 			"cp -i"
abbr mv 			"mv -i"
abbr pipu     "pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

# get error messages from journalctl
abbr jctl 		"journalctl -p 3 -xb"

# pacman
abbr p 				"yay"
abbr prm 			"sudo rm -rf /var/cache/pacman/"
abbr orphans 	"yay -Qqtd"
abbr pror 		"yay -Rscn (yay -Qqtd)"
abbr pr 			"yay -Rscn"
abbr pss 			"yay -Slq | fzf -m --preview 'yay -Si {1}'  --preview-window="wrap" | xargs -ro  yay -S"
abbr psr 			"yay -Qeq | fzf -m --preview 'yay -Si {1}'  --preview-window="wrap" | xargs -ro  yay -Rscn"


# navigation
abbr ..  			"cd .."
abbr ... 			"cd ../.."
abbr .3  			"cd ../../.."
abbr .4  			"cd ../../.."
abbr .5  			"cd ../../../..'"
abbr .6  			"cd ../../../../.."

# git
abbr g 				"git"
abbr addup 		"git add -u"
abbr addall 	"git add ."
abbr branch 	"git branch"
abbr checkout "git checkout"
abbr commit 	"git commit -m"
abbr fetch 		"git fetch"
abbr pull 		"git pull origin"
abbr status 	"git status"
abbr tag 			"git tag"
abbr newtag 	"git tag -a"
abbr push 		"git remote | xargs -L1 git push --all"

function fish_user_key_bindings
	fzf_key_bindings
end

function fzf-dir-cd
	cd (dirname (locate home media | fzf -i -e))
end

function fzf-full-cd
	cd (dirname (locate / | fzf -i -e))
end

function fzf-file-edit
	find ~/.config ~/.local ~/.scripts ~/* -type f | fzf -i -e | xargs -r $EDITOR
end

bind \cg fzf-file-edit

if bind -M insert > /dev/null 2>&1
	bind -M insert \cg fzf-file-edit
end

function ramuse
	ps axo rss,comm,pid \
                | awk '{ proc_list[$2]++; proc_list[$2 "," 1] += $1; } \
                END { for (proc in proc_list) { printf("%d\t%s\n", \
                proc_list[proc "," 1],proc); }}' | sort -n | tail -n 10 | sort -rn \
                | awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
end

# starts ssh agent on loggin into tty
setenv SSH_ENV $HOME/.ssh/environment

function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

set -U fish_color_normal normal
set -U fish_color_command 98971a # #98971a
set -U fish_color_quote d79921 # #d79921
set -U fish_color_redirection d8d8d8 # #d8d8d8
set -U fish_color_end ba8baf # #ba8baf
set -U fish_color_error ab4642 # #ab4642
set -U fish_color_param d8d8d8 # #d8d8d8
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 7cafc2 # #7cafc2
set -U fish_color_escape 86c1b9 # #86c1b9
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 585858 # #585858
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow # #B3A06D
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_match 98971a # #98971a
set -U fish_color_comment f7ca88 # #f7ca88

