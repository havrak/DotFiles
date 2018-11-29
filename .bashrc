#
# ~/.bashrc
#

stty -ixon #disable ctrl+s; ctrl+q

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# >>> Added by cnchi installer
BROWSER=/usr/bin/firefox
# EDITOR=/usr/bin/vim
EDITOR=vim
VISUAL=$EDITOR
export EDITOR VISUAL


#aliases
alias p="sudo pacman"
alias v="vim"
alias orphans="pacman -Qqtd"
alias sr="sudo ranger"
alias r="ranger"
alias c="clear"
alias sv="sudoedit"
alias pushconfig="git push git@github.com:havrak/DotFiles.git"
alias music="ncmpcpp"
alias s="subl3"
alias pi3="ssh -Y pi@192.168.1.9"
alias zathura="nohup zathura"

if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi
