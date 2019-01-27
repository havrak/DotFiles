#
# ~/.bash_profile
#

#disable ctrl+s
stty -ixon
i
[[ -f ~/.bashrc ]] && . ~/.bashrc


alias ls='ls --color=auto'
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export VISUAL="nvim"

#aliases
alias p="sudo yaourt"
alias v="vim"
alias orphans="yaourt -Qqtd"
alias sr="sudo ranger"
alias r="ranger"
alias c="clear"
alias sv="sudoedit"
alias g="git"
alias music="ncmpcpp"
alias zathura="zathura --fork"

