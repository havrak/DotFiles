stty -ixon

[[ $- != *i* ]] && return

alias ls='ls --group-directories-first --color=auto'
export PATH="$PATH:$(du "$HOME/bin/scripts/" | cut -f2 | tr '\n' ':')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export VISUAL="nvim"


#aliases
alias p="yay"
alias v="nvim"
alias orphans="yaourt -Qqtd"
alias sr="sudo ranger"
alias r="ranger"
alias c="clear"
alias sv="sudoedit"
alias grp="git remote | xargs -L1 git push --all"
alias g="git"
alias music="ncmpcpp"
alias z="zathura --fork"
alias s="sxiv"

export PS1="\[$(tput sgr0)\]\[$(tput setaf 3)\]\$?b \u\[$(tput setaf 2)\]@\[$(tput bold)\]\[$(tput setaf 5)\]\h\[$(tput sgr0)\]\[$(tput setaf 2)\]:\[$(tput bold)\]\[$(tput setaf 4)\]\W\[$(tput sgr0)\]\[$(tput setaf 1)\]>\[$(tput setaf 7)\] "


alias tmuxn='tmux new-session -s $$'

