let g:startify_custom_header = []
let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]

" \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_before_save = [ 'silent! NvimTreeClose', 'sleep 100m' ]

let g:startify_bookmarks = [
            \ { 'po': '~/.config/polybar/config' },
            \ { 'ra': '~/.config/ranger/rc.conf' },
            \ { 'ri': '~/.config/ranger/rifle.conf' },
            \ { 'fi': '~/.config/fish/config.fish' },
            \ { 'fa': '~/.config/fish/abbreviations.fish' },
            \ { 'fv': '~/.config/fish/fish_variables' },
            \ { 'a': '~/.bashrc' },
            \ { 'b': '~/.config/bspwm/bspwmrc' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'm': '~/.config/nvim/macros.vim' },
            \ { 'x': '~/.Xresources' },
            \ { 'n': '~/.config/newsboat/config' },
            \ { 'u': '~/.config/newsboat/urls' },
            \ { 'pi': '~/.config/picom/picom.conf' },
            \ { 's': '~/.config/sxhkd/sxhkdrc' },
            \ ]

