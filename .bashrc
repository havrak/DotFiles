#
# ~/.bashrc
#

#disable ctrl+s
stty -ixon

[[ $- != *i* ]] && return

alias ls='ls --group-directories-first --color=auto'
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export PATH="$HOME/esp/xtensa-esp32-elf/bin:$PATH"
export IDF_PATH="$HOME/esp/esp-idf"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export VISUAL="nvim"


#aliases
alias p="yaourt"
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
alias java8jar="/usr/lib/jvm/java-8-jdk/jre/bin/java -jar"
alias java8="/usr/lib/jvm/java-8-jdk/jre/bin/java"

if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

