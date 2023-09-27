local M = {'mhinz/vim-startify', lazy = false, priority =999}

function M.config()

vim.api.nvim_exec([[
let g:startify_custom_header = []
let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_before_save = [ 'silent! NvimTreeClose', 'sleep 100m' ]

let g:startify_bookmarks = [
						\ { 'st': '~/dox/school/University/DITA - Digitální technika/poznamnky.tex'},
						\ { 'sp': '~/dox/school/University/ELPA - Elektronické prvky/poznamnky.tex'},
						\ { 'sm': '~/dox/school/University/EMB - Elektrická měření/poznamnky.tex'},
						\ { 'se': '~/dox/school/University/EMPA - Elektromagnetické pole/poznamnky.tex'},
						\ { 'sk': '~/dox/school/University/KANA - Komplexní analýza/poznamnky.tex'},
						\ { 'so': '~/dox/school/University/KEO - Konstrukce a realizace elektronických obvodů/poznamnky.tex'},
						\ { 'sf': '~/dox/school/University/FY2 - Fyzika 2/poznamnky.tex'},
            \ { 'fi': '~/.config/fish/config.fish' },
            \ { 'fa': '~/.config/fish/abbreviations.fish' },
						\ { 'lb': '~/dox/templates/basic.tex'},
						\ { 'lm': '~/dox/templates/makra.tex'},
            \ { 'm': '~/.config/nvim/lua/macros.lua' },
            \ ]
]], false)

end
return M
