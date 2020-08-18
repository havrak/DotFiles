let mapleader =" "

call plug#begin('~/.config/nvim/plugged')
" Formating
Plug 'Chiel92/vim-autoformat'
Plug 'dhruvasagar/vim-table-mode'
" Commenting
Plug 'tpope/vim-commentary'
" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Files
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
" Code Completion
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Motions
Plug 'easymotion/vim-easymotion'
" Syntax highlighting
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Misc
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-repeat'
call plug#end()

" Some basics:
set nocompatible
filetype plugin on
set tabstop=2 shiftwidth=2
syntax on
set encoding=utf-8
set relativenumber number
set clipboard=unnamedplus
set termguicolors
let g:gruvbox_italic=1
let g:python3_host_prog='/usr/bin/python'
set background=dark
colorscheme gruvbox
set mouse=a

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Fix indenting visual block
vmap < <gv
vmap > >gv

" Bindings to get to cmdline
nmap ; :
nmap ů :

" Shortcut for tabedit
nmap te :tabedit <c-r>

" Enable autocompletion:
set wildmode=longest,list,full

" Disables automatic comenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Typing
map <leader>o :setlocal spell! spelllang=en_us,cs,de \| set linebreak <CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitright splitbelow

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left><Left>

" Compile document
map <leader>c :w! \| !compiler <c-r>%<CR>

" Compile document
map <leader>r :!texclear <c-r>%<CR><CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard
map <C-c> "*y :let @+=@*<CR>
map <C-x> "*x :let @+=@*<CR>
map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Run command on update of certain files
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
autocmd BufWritePost ~/.config/newsboat/urls !rsw -r

" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l

" NERDTree
let NERDTreeShowHidden=1
map <leader>t :NERDTreeToggle<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
autocmd VimEnter * :silent AirlineToggleWhitespace

" Vim Hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla']
let g:Hexokinase_highlighters = ['backgroundfull']
autocmd VimEnter * HexokinaseTurnOn

" Goyo
let g:goyo_width=150
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| setlocal spell! spelllang=en_us,cs,de \| set linebreak
map <leader>f :silent Goyo \| setlocal spell! spelllang=en_us,cs,de \| set linebreak<CR>

" Easy Motion
map <leader><leader>. <Plug>(easymotion-repeat)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>j <Plug>(easymotion-overwin-line)
nmap <leader><leader>k <Plug>(easymotion-overwin-line)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

" Load external files
runtime macros.vim
runtime cocrc.vim
