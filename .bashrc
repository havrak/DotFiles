stty -ixon

[[ $- != *i* ]] && return

if command -v bat &>/dev/null; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

export PATH="$PATH:$(du "$HOME/bin/scripts/" | cut -f2 | tr '\n' ':')"
export TERMINAL="st"
export TERM="xterm-256color"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export VISUAL="nvim"

export PS1="\[$(tput sgr0)\]\[$(tput setaf 3)\]\$?b \u\[$(tput setaf 2)\]@\[$(tput bold)\]\[$(tput setaf 5)\]\h\[$(tput sgr0)\]\[$(tput setaf 2)\]:\[$(tput bold)\]\[$(tput setaf 4)\]\W\[$(tput sgr0)\]\[$(tput setaf 1)\]>\[$(tput setaf 7)\]"

# move with shift+Left/Right between words
bind '"\e[1;2D": backward-word'
bind '"\e[1;2C": forward-word'

# setup editor
if command -v nvim &>/dev/null; then
	export EDITOR="nvim"
	alias v="nvim"
	alias vim="nvim"
else
	export EDITOR="vim"
	alias v="vim"
fi

#aliases
alias sr="sudo ranger"
alias r="ranger"
alias n="neomutt"
alias sv="sudoedit"
alias mus="ncmpcpp"
alias s="sensors"
alias yt="youtube-dl"
alias SS="sudo systemctl"
alias pyserver="python3 -m http.server"
alias cp="cp -i"
alias mv="mv -i"
alias ms="mw -Y 2>/dev/null"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

alias jctl="journalctl -p 3 -xb"

# mount devices/android
alias ud="udisksctl unmount -b /dev/sdb"
alias md="udisksctl mount -b /dev/sdb"
alias ma="aft-mtp-mount ~/tmp/android/"
alias ua="sudo umount ~/tmp/android --lazy"

# package manager
case $(cat /etc/*-release 2>/dev/null | grep "^ID=" | awk -F '=' '{print $2}' 2>/dev/null) in
	arch)
		alias p="yay"
		alias po="yay -S --overwrite \"*\""
		alias prm="sudo rm -rf /var/cache/pacman/"
		alias orphans="yay -Qqtd"
		alias pr="yay -Rscn"
		alias pss="yay -Slq | fzf -m --preview 'yay -Si {1}'  --preview-window="wrap" | xargs -ro  yay -S"
		alias psr="yay -Qeq | fzf -m --preview 'yay -Si {1}'  --preview-window="wrap" | xargs -ro  yay -Rscn"
		;;
	debian | raspbian)
		alias p="sudo apt"
		alias pr="sudo apt autoremove"
		alias pu="sudo apt update && sudo apt upgrade"
		alias pss="apt list | awk -F \"/\" '{print \$1}' | tail -n +2 | fzf -m --preview 'apt show {1}' --preview-window=wrap | xargs -ro sudo apt install"
		alias psr="apt list --installed | awk -F \"/\" '{print \$1}' | tail -n +2 | fzf -m --preview 'apt show {1}' --preview-window=wrap | xargs -ro sudo apt autoremove"
		;;
esac

alias pipu="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias spipu="sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../.."
alias .5="cd ../../../..'"
alias .6="cd ../../../../.."


# ls -> exa
if command -v exa &>/dev/null; then
	alias ls='exa -al --color=always --group-directories-first' # my preferred listing
	alias la='exa -a --color=always --group-directories-first'  # all files and dirs
	alias ll='exa -l --color=always --group-directories-first'  # long format
	alias lt='exa -aT --color=always --group-directories-first' # tree listing
else
	if [ $(uname -a | awk '{print $1}') != "SunOS" ] ; then
		alias ls='ls --group-directories-first --color=auto -al'
		alias la='ls --group-directories-first --color=auto -a'
		alias ll='ls --group-directories-first --color=auto -l'
		alias lt='ls --group-directories-first --color=auto -aT'
	else
		alias ls='ls --color=auto -al'
		alias la='ls --color=auto -a'
		alias ll='ls --color=auto -l'
		alias lt='ls --color=auto -aT'
	fi
fi

# git
alias g="git"
alias addup="git add -u"
alias addall="git add ."
alias branch="git branch"
alias checkout="git checkout"
alias commit="git commit -m"
alias fetch="git fetch"
alias pull="git pull origin"
alias status="git status"
alias tag="git tag"
alias newtag="git tag -a"
alias push="git remote | xargs -L1 git push --all"
