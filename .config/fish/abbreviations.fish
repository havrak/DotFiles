#!/usr/bin/fish

abbr v 				"nvim"
abbr vim 			"nvim"
abbr sr 			"sudo ranger"
abbr r 				"ranger"
abbr n 				"neomutt"
abbr sv 			"sudoedit"
abbr mus 			"ncmpcpp"
abbr s 				"sensors"
abbr yt 			"yt-dlp"
abbr SS 			"sudo systemctl"
abbr pyserver "python3 -m http.server"
abbr cp 			"cp -i"
abbr mv 			"mv -i"
alias ms  		"mw -Y 2>/dev/null"
alias ccmake 	"cmake . && make"
alias cmake 	"cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias rsync 	"rsync --info=progress2"
alias xppen    "setsid -f sudo /usr/lib/pentablet/pentablet.sh"
alias packettracer "/opt/pt/packettracer"
abbr jctl 		"journalctl -p 3 -xb"

# mount device/android
abbr ud 			"udisksctl unmount -b /dev/sdb"
abbr md 			"udisksctl mount -b /dev/sdb"
abbr ma 			"aft-mtp-mount ~/tmp/android/"
abbr ua 			"sudo umount ~/tmp/android --lazy"

# ssh connections, tunnels
abbr sshschool 		"ssh dk-301@db.gyarab.cz"
abbr sshsql 			"ssh -L 3306:localhost:3306 havrak.xyz"
abbr sshfit       "ssh -oHostKeyAlgorithms=+ssh-rsa  ar_013@fray1.fit.cvut.cz"

abbr picamup      "gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=YUY2,width=640,height=480,framerate=30/1 ! jpegenc ! rtpjpegpay ! udpsink host=192.168.6.11 port=5000"
abbr picamdw      "gst-launch-1.0 -v udpsrc port=5000 ! application/x-rtp, media=video, clock-rate=90000, payload=96 ! rtpjpegdepay ! jpegdec ! videoconvert ! autovideosink"

# rsync commands
abbr syd 					"rsync -vrh --exclude 'CMakeFiles' --exclude 'CMakeCache.txt' --exclude '.cache' --exclude '.git' $HOME/prog/uav\ project/drone\ software/  192.168.6.1:~/drone_software"
abbr sys 					"rsync -vrh --exclude '.git' $HOME/dox/school/ /run/media/$USER/500\ GB/dox/school/ --delete-after"
abbr syi 					"rsync -vrh --exclude '.git' $HOME/pix/ /run/media/$USER/500\ GB/pix/ --delete-after"
abbr syc 					"rsync -vrh --exclude 'CMakeFiles' --exclude 'CMakeCache.txt' --exclude '.tmp' --exclude '.cache' --exclude 'node_modules' --exclude '.git' --exclude '.jekyll-cache' --exclude '__pycache__' $HOME/prog /run/media/$USER/500\ GB/prog --delete-after"
abbr syw 					"rsync -vrhL --exclude '.git' $HOME/.vim/vimwiki havrak.xyz: --delete-after"
abbr syp 					"rsync -vrhL --exclude '.git' $HOME/prog/web/portfolio havrak.xyz: --delete-after"
abbr syW 					"whiptail --yesno \"Do you truly wish to sync vimwiki from remote to local\" 20 60 && rsync -vrh --exclude '.git' havrak.xyz:vimwiki $HOME/.vim/ --delete-after"
abbr sya 					"scp .abook/addressbook havrak.xyz:~/.abook/"
abbr syA 					"scp havrak.xyz:~/.abook/addressbook ~/.abook/"

# package manager



switch (cat /etc/*-release 2>/dev/null | grep "^ID=" | awk -F '=' '{print $2}')
	case arch
		abbr p 				"yay"
		abbr po 			"yay -S --overwrite \"*\""
		abbr prm 			"sudo rm -rf /var/cache/pacman/"
		abbr orphans 	"yay -Qqtd"
		abbr pr 			"yay -Rscn"
		abbr pss 			"yay -Slq | fzf -m --preview 'yay -Si {1}'  --preview-window="wrap" | xargs -ro  yay -S"
		abbr psr 			"yay -Qeq | fzf -m --preview 'yay -Si {1}'  --preview-window="wrap" | xargs -ro  yay -Rscn"
	case debian raspbian
		abbr p 				"sudo apt"
		abbr pr 			"sudo apt autoremove"
		abbr pu       "sudo apt update && sudo apt upgrade"
		abbr pss      "apt list | awk -F \"/\" '{print \$1}' | tail -n +2 | fzf -m --preview 'apt show {1}' --preview-window=wrap | xargs -ro sudo apt install"
		abbr psr      "apt list --installed | awk -F \"/\" '{print \$1}' | tail -n +2 | fzf -m --preview 'apt show {1}' --preview-window=wrap | xargs -ro sudo apt autoremove"
end

abbr pipu     "pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
abbr spipu    "sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U"

# navigation
abbr ..  			"cd .."
abbr ... 			"cd ../.."
abbr .3  			"cd ../../.."
abbr .4  			"cd ../../.."
abbr .5  			"cd ../../../..'"
abbr .6  			"cd ../../../../.."

# ls -> exa
if type -q exa
	alias ls 		"exa -al --color=always --group-directories-first" # my preferred listing
	alias la 		"exa -a --color=always --group-directories-first"  # all files and dirs
	alias ll 		"exa -l --color=always --group-directories-first"  # long format
	alias lt 		"exa -aT --color=always --group-directories-first" # tree listing
else
	alias ls 		"ls --group-directories-first --color=auto -al"
	alias la 		"ls --group-directories-first --color=auto -a"
	alias ll 		"ls --group-directories-first --color=auto -l"
	alias lt 		"ls --group-directories-first --color=auto -aT"
end

# git
abbr g 				"git"
abbr add 			"git add"
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
