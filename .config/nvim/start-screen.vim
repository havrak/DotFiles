let g:startify_custom_header = [
			\'      __                           __  _                __           ',
			\'     / /_  ____ __   ___________ _/ /_( )_____   _   __(_)___ ___    ',
			\'    / __ \/ __ `/ | / / ___/ __ `/ //_/// ___/  | | / / / __ `__ \   ',
			\'   / / / / /_/ /| |/ / /  / /_/ / ,<   (__  )   | |/ / / / / / / /   ',
			\'  /_/ /_/\__,_/ |___/_/   \__,_/_/|_| /____/    |___/_/_/ /_/ /_/    ',
			\]
let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1


let g:startify_bookmarks = [
            \ { 'po': '~/.config/polybar/config' },
            \ { 'ra': '~/.config/ranger/rc.conf' },
            \ { 'ri': '~/.config/ranger/rifle.conf' },
            \ { 'fi': '~/.config/fish/config.fish' },
            \ { 'fv': '~/.config/fish/fish_variables' },
            \ { 'b': '~/.config/bspwm/bspwmrc' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'm': '~/.config/nvim/macros.vim' },
            \ { 'c': '~/.config/nvim/cocrc.vim' },
            \ { 'x': '~/.Xresources' },
            \ { 'n': '~/.config/newsboat/config' },
            \ { 'u': '~/.config/newsboat/urls' },
            \ { 'pi': '~/.config/picom/picom.conf' },
            \ { 's': '~/.config/sxhkd/sxhkdrc' },
            \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_session_autoload = 1
let g:startify_enable_special = 0
