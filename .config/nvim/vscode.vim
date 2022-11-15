let mapleader =" "

call plug#begin('~/.config/nvim/plugged')
Plug 'aperezdc/vim-template'                                " template support in vim
Plug 'tpope/vim-commentary'																	" easy commenting
call plug#end()

" Some basics:
set nocompatible
filetype plugin indent on
syntax on
set tabstop=2 shiftwidth=2 smarttab
set encoding=utf-8
set relativenumber number
set clipboard=unnamedplus
set signcolumn=yes
set termguicolors
set cursorline
set nobackup
set nowritebackup
set noswapfile
set wrap
set linebreak
set breakindent
set hidden
set autoindent
set smartindent
set incsearch
set smartindent
set shortmess+=c
set mouse=a

" Use UFT-8
setglobal termencoding=utf-8
setglobal fileencodings=utf-8
scriptencoding utf-8
set encoding=utf-8

" Enable autocompletion:
set wildchar=<Tab> wildmenu wildmode=longest,full
set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" setting up varialbes to be used in templates
let g:email="krystof@havrak.xyz"
let g:username="Kryštof Havránek"

" Fix indenting visual block
vmap < <gv
vmap > >gv
vmap ? <gv
vmap : >gv

" Bindings to get to cmdline
nnoremap ; :
nnoremap ů :

" Disables automatic comenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Replace all is aliased to S.
nnoremap S <Cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<CR>
xnoremap S <Cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<CR>

" Copy selected text to system clipboard
noremap y "+y :let @*=@+<CR>
noremap x "+x :let @*=@+<CR>
noremap p "+P

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" vim-template
let g:templates_directory= '/home/havra/.vim/templates'
let g:templates_no_autocmd=0
let g:templates_detect_git=1
