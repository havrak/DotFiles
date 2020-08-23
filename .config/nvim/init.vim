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
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Motions
Plug 'pechorin/any-jump.vim'
Plug 'easymotion/vim-easymotion'
" Syntax highlighting
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Misc
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-repeat'
Plug 'vimwiki/vimwiki'
Plug 'kshenoy/vim-signature'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
call plug#end()

" Some basics:
set nocompatible
filetype plugin on
set tabstop=2 shiftwidth=2 smarttab
syntax on
set encoding=utf-8
set relativenumber number
set clipboard=unnamedplus
set signcolumn=yes
set termguicolors
set cursorline
set cursorcolumn
set nobackup
set noswapfile
set linebreak
set hidden
set autoindent
set smartindent
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

" Enable autocompletion:
set wildchar=<Tab> wildmenu wildmode=longest,full
set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp

" Disables automatic comenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Typing
map <leader>o :setlocal spell! spelllang=en_us,cs,de <CR>

" Splits open at the bottom and right
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

" Make buffers more practical
nnoremap gt :bnext<CR>
nnoremap gb :edit #<CR>
nnoremap gn :enew \| Startify <CR>
nnoremap Q :w\|bd<CR>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left><Left>

" Compile document
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard
map <C-c> "*y
map <C-x> "*x
map <C-p> "+P

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Run command on update of certain files
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
autocmd BufWritePost ~/.config/newsboat/urls !rsw -r

" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l

" Custom commands
command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.vimrc"

" Special highlighting
hi DELETE			term=standout guibg=white guifg=red		ctermbg=white ctermfg=red
hi TODO				term=standout guifg=blue	guibg=white ctermbg=blue	ctermfg=white
hi NOTE				term=standout guifg=blue	guibg=white ctermbg=green ctermfg=red
hi NEXT				term=standout guifg=red		guibg=green ctermbg=blue	ctermfg=red
hi IMPORTANT	term=bold			guibg=red		guifg=white ctermbg=red		ctermfg=white
hi OPTIONAL		term=bold			guibg=green guifg=white ctermbg=green ctermfg=white
call matchadd('TODO','TODO')
call matchadd('NOTE','NOTE')
call matchadd('NEXT', 'NEXT')
call matchadd('IMPORTANT', 'IMPORTANT')
call matchadd('DELETE', 'DELETE')
call matchadd('OPTIONAL', 'OPTIONAL')

" Use UFT-8
setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8

" NERDTree
function! ToggleNERDTree()
	NERDTreeToggle
	silent NERDTreeMirror
endfunction

map <leader>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeHijackNetrw=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
autocmd StdinReadPre * let s:std_in=1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
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
map <leader>y :silent Goyo \| setlocal spell! spelllang=en_us,cs,de <CR>

" Easy Motion
let g:EasyMotion_do_shade = 0
map <leader><leader>. <Plug>(easymotion-repeat)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>j <Plug>(easymotion-overwin-line)
nmap <leader><leader>k <Plug>(easymotion-overwin-line)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

" FzF
nnoremap <c-g> :GFiles<CR>
nnoremap <c-z> :Files<CR>
nmap ?? :Rg<CR>
nmap // :BLines<CR>
let g:fzf_preview_window = 'right:50%'
command! FileHistory execute ":BCommits!"
nmap cc :Commands<CR>

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --color=always --smart-case -- '.shellescape(<q-args>), 1,fzf#vim#with_preview(), <bang>0)

" Ranger
let g:ranger_map_keys=0
map <leader>r :Ranger<CR>

" Autoformat
nmap F :Autoformat<CR>

" Load external files
runtime macros.vim
runtime cocrc.vim
runtime start-screen.vim
