# GNU/LINUX Dotfiles

In this repository are my personal dotfiles which I use on my arch system. Terminal is hardcoded to config files.

# Dotfiles in this repo
+ bspwm
+ nvim
+ polybar
+ bash
+ fish
+ dmenu
+ mpd
+ ncmpcpp
+ vlc
+ ranger
+ zathura
+ sxiv
+ dunst
+ firefox - bookmarks, sideberry, channel blocker, addons, css (small changes necessary for vertical tabs), mozilla.cfg (privacy features, pretty sure it breaks google login)
+ Xresources
+ mpv
+ youtube-dl
+ sxhkd
+ transmission
+ picom


# Necessary programms
| NAME                     | PURPOUSE                                    | NOTE                            |
|--------------------------|---------------------------------------------|---------------------------------|
| abook                    | address book for neomutt                    |                                 |
| acpi                     | get information whether battery is charging |                                 |
| arandr                   | gui screen adjusment                        |                                 |
| bat                      | cat with syntax highlightning               |                                 |
| brave-bin                | used as secondary browser                   |                                 |
| bsp-layout               | provides more layouts for bspwm             |                                 |
| bspwm                    | my window manager of choice                 |                                 |
| cronie                   | schedules tasks                             |                                 |
| dmenu                    | program launcher                            | https://github.com/havrak/dmenu |
| dragon-drag-and-drop-git | enables drag and drop in terminal           |                                 |
| dunst                    | notifications                               |                                 |
| firefox                  | my browser of choice                        |                                 |
| find                     | searches for files                          |                                 |
| fd                       | simmilar to find, but faster                |                                 |
| fish                     | my shell of choice                          |                                 |
| fzf                      | fuzzy finder used in ranger and shell       |                                 |
| git                      | vcs system                                  |                                 |
| gvim                     | enables clipboard buffer for vim            |                                 |
| i3lock-cac03-git         | i3lock fork that displays layout and time   |                                 |
| imagemagick              | used to create background for lockscreen    |                                 |
| lib32-vulkan-intel       | use vulkan backend for mpv                  |                                 |
| libnotify                | enables notify-send command                 |                                 |
| libva-intel-driver       | intel driver                                |                                 |
| libxft-bgra-git          | emojis in st                                |                                 |
| light                    | adjust screen brightness                    |                                 |
| lynx                     | html mails in neomutt                       |                                 |
| mpc                      | controls form mpd deamon                    |                                 |
| mpd                      | music deamon                                |                                 |
| mpv                      | media player                                |                                 |
| mutt-wizzard-git         | sets up neomutt                             |                                 |
| ncmpcpp                  | terminal frontend for mpd                   |                                 |
| neovim                   | my editor of choice                         |                                 |
| nerd-fonts-mononoki      | my font of choice                           |                                 |
| newsboat                 | terminal rss client                         |                                 |
| nodejs                   | used by neovim extension                    |                                 |
| notmuch                  | sorting in neomutt                          |                                 |
| pavucontrl               | gui way to control pulse audio              |                                 |
| picom                    | compositor                                  |                                 |
| polybar-git              | status bar                                  |                                 |
| pynvim                   | enables python is nvim                      | available via pip               |
| ranger                   | terminal file browse                        |                                 |
| redshift                 | blue light filter                           |                                 |
| ripgrep                  | used by nvim addon                          |                                 |
| scrot                    | tool for taking screenshot                  |                                 |
| shadowfox-updater        | install dark css for firefox                |                                 |
| simple-mtpfs             | mounting android phones                     |                                 |
| st                       | terminal                                    | https://github.com/havrak/st    |
| stubby                   | DNS deamon                                  |                                 |
| sxhkd                    | key deamon for bspwm                        |                                 |
| sxiv                     | image viewer                                |                                 |
| tlp                      | battery managment                           |                                 |
| tlpui-git                | gui for tlp                                 |                                 |
| transmission-cli         | transmission deamon                         |                                 |
| tremc                    | transmission frontend                       |                                 |
| udisck2                  | better mounting                             |                                 |
| ueberzug                 | images in terminal                          | available via pip               |
| ttf-dejavu               | font                                        |                                 |
| ttf-inconsolata          | font                                        |                                 |
| ttf-joypixels            | emojis                                      |                                 |
| ttf-nerd-fonts-symbols   | glyphs for polybar                          |                                 |
| ttf-sazanami             | Japanese font for polybar                   |                                 |
| ttf-symbola              | font                                        |                                 |
| vulkan-intel             | used by mpv                                 |                                 |
| xclip                    | clipboard                                   |                                 |
| xdo                      | used in scripts controls X windows          |                                 |
| xdotool                  | used in scripts controls X windows          |                                 |
| xf86-input-synaptics     | drivers for touchpad                        |                                 |
| xf86-video-intel         | video drivers                               |                                 |
| xorg-server              |                                             |                                 |
| xorg-xinit               |                                             |                                 |
| xorg-xkill               | kills x window                              |                                 |
| xwallpaper               | utility for setting up wallpaper            |                                 |
| yay-git                  | aur helper                                  | https://github.com/Jguer/yay    |
| youtube-dl               | download youtube videos                     |                                 |
| zathura                  | pdf viewer                                  |                                 |
| zathura-djvu             | djvu plugin for zathura                     |                                 |
| zathura-pdf-mupdf        | pdf plugin for zathura                      |                                 |

# Firefox plugins

| NAME                | PURPOUSE                                                                                                   |
|---------------------|------------------------------------------------------------------------------------------------------------|
| Cookie AutoDelete   | deletes cookies after user leaves the site                                                                 |
| LocalCDN            | gets rid of injected sources                                                                               |
| h264ify             | using 4. get intel procesor, no hardware support for x265 or VP9                                           |
| HTTPS Everywhere    | upgrades connection to HTTPS                                                                               |
| Sidebery            | tab+bookmark bar on the right side of screen                                                               |
| Stylus              | custom css for some sites                                                                                  |
| Tridactyl           | vim like control in browser                                                                                |
| uBlock Origin       | blocks adds                                                                                                |
| User-Agent Switcher | switches user-agent string, harder tracking                                                                |
| Violentmonkey       | Custom JS Scripts -- 4ChanX, OneeChan, ResizeYoutubePlayerToWindowSize, Absolute Enable Right Click & Copy |
| Channel Blocker     | best way to hide/block YT channels                                                                         |
