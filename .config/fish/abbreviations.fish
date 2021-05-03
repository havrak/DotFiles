#!/usr/bin/fish
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
abbr smloadr 	"smloadr -p /home/havra/dw/deezloader/ -q FLAC"
abbr cp 			"cp -i"
abbr mv 			"mv -i"
abbr pipu     "pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
abbr un 			"udisksctl unmount -b /dev/sdb"
abbr um 			"udisksctl mount -b /dev/sdb"

# ssh connections and tunnels
abbr sshschool 		"ssh dk-301@db.gyarab.cz"
abbr sshschoolsql "ssh -L 3306:localhost:3306 dk-301@db.gyarab.cz"
abbr sshsql 			"ssh -L 3306:localhost:3306 havrak.xyz"
abbr sshlxd 			"ssh -L 8443:localhost:8443 -L 27017:localhost:27017 havrak.xyz"

# get error messages from journalctl
abbr jctl 		"journalctl -p 3 -xb"

# pacman
abbr p 				"yay"
abbr po 			"yay -S --overwrite \"*\""
abbr prm 			"sudo rm -rf /var/cache/pacman/"
abbr orphans 	"yay -Qqtd"
abbr rorphans	"yay -Rscn (yay -Qqtd)"
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
abbr fdcd     "cd (dirname (locate home media | fzf -i -e))"
abbr ffvd     "cd (dirname (locate / | fzf -i -e))"

# ls -> exa
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

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

