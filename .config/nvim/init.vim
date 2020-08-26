let mapleader =" "

call plug#begin('~/.config/nvim/plugged')
" Formating
Plug 'Chiel92/vim-autoformat' 															" autoformats file, normally use CoC feature
Plug 'dhruvasagar/vim-table-mode' 													" makes markdown tables less infuriating
" Commenting
Plug 'tpope/vim-commentary' 																" easy commenting
" Airline
Plug 'bling/vim-airline' 																		" feature packed status line
Plug 'vim-airline/vim-airline-themes' 											" themes for airline
" Files
Plug 'scrooloose/nerdtree' 																	" IDE-like file browser
Plug 'junegunn/fzf.vim' 																		" fuzzy finder integration in vim
Plug 'francoiscabrol/ranger.vim' 														" ranger file browser integration in vim
Plug 'rbgrouleff/bclose.vim' 																" closes buffer without closing window, same y Q mapping but necessary for ranger plugins
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'} 						" Code completion and much more
Plug 'honza/vim-snippets' 																	" buch of snippets to work with CoC
" Git
Plug 'airblade/vim-gitgutter'                               " shows changes in signcolumn
Plug 'tpope/vim-fugitive' 																	" better integration with git commands
Plug 'tpope/vim-rhubarb' 																		" enables GBrowse - opens file in github
Plug 'rhysd/git-messenger.vim' 															" displays commit message from commit that affected the line (on <leader>gm)
" Motions
Plug 'pechorin/any-jump.vim' 																" searches for definitions and references across files, better than coc's <leader>gd and ripgrep
Plug 'easymotion/vim-easymotion' 														" enables new ways to move through file
" Syntax highlighting
Plug 'morhetz/gruvbox' 																			" gruvbox color scheme used by vim
Plug 'rust-lang/rust.vim' 																	" better highlighting for rust lang
Plug 'kovetskiy/sxhkd-vim' 																	" highlighting for sxhkd configuration
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } 	" color hex codes will display corresponding color
" Misc
Plug 'junegunn/goyo.vim' 																		" writing mode that cleans up the vim UI
Plug 'tpope/vim-repeat'  																		" . repeats the whole map if map is defined with repeat#
Plug 'vimwiki/vimwiki' 																			" note-organizing tool in vim, org mode like
Plug 'kshenoy/vim-signature' 																" shows tag in signcolumn, currently overlaps gitgutter tags
Plug 'metakirby5/codi.vim' 																	" runs code while editing, only languages with interactive shell
Plug 'mhinz/vim-startify' 																	" gives vim pretty start screen (bye bye Uganda), manages stored vim sessions
Plug 'mbbill/undotree' 																			" complex undo enables moving to already rewritten changes
call plug#end()

" Some basics:
set nocompatible
filetype plugin on
syntax on
set tabstop=2 shiftwidth=2 smarttab
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
set breakindent
set hidden
set autoindent
set foldmethod=indent
set incsearch
set smartindent
set splitright
set splitbelow
set undofile
set undodir="~/.vim/undo/"
set mouse=a
let g:python3_host_prog='/usr/bin/python'

" Color Scheme
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

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

" Fix indenting visual block
vmap < <gv
vmap > >gv

" Bindings to get to cmdline
nnoremap ; :
nnoremap ů :

" Disables automatic comenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Typing
noremap <leader>o :setlocal spell! spelllang=en_us,cs,de <CR>

" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

nnoremap <C-s>h :vertical resize -5<CR>
nnoremap <C-s>j :resize -5<CR>
nnoremap <C-s>k :resize +5<CR>
nnoremap <C-s>l :vertical resize +5<CR>

" Make buffers more practical
nnoremap gt :bnext<CR>
nnoremap gb :edit #<CR>
nnoremap gn :enew \| Startify <CR>
nnoremap Q :w\|bd<CR>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left>
xnoremap S :%s///g<Left><Left>

" Compile document
nnoremap <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
nnoremap <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard
noremap <C-c> "*y :let @+=@*<CR>
noremap <C-x> "*x :let @+=@*<CR>
noremap <C-p> "+P
noremap p "+P

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Run command on update of certain files
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
autocmd BufWritePost ~/.config/newsboat/urls !rsw -r

" Navigating with guides
inoremap 	<C-w> <Esc>/<++><Enter>"_c4l
vnoremap 	<C-w> <Esc>/<++><Enter>"_c4l
nnoremap 	<C-w> <Esc>/<++><Enter>"_c4l

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


" NERDTree
function! ToggleNERDTree()
	NERDTreeToggle
	silent NERDTreeMirror
endfunction

"nnoremap <silent> <expr> <Leader>t g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
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
let g:airline#extensions#whitespace#enabled= 0

" Vim Hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla']
let g:Hexokinase_highlighters = ['backgroundfull']
autocmd BufEnter * HexokinaseTurnOn

" Goyo;
let g:goyo_width=150
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| setlocal spell! spelllang=en_us,cs,de \| set breakindent \| set linebreak
nnoremap <leader>y :Goyo \| setlocal spell! spelllang=en_us,cs,de \| set breakindent \| set linebreak <CR>

" Easy Motion
let g:EasyMotion_do_shade = 0
map <leader><leader>.  <Plug>(easymotion-repeat)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>j <Plug>(easymotion-overwin-line)
nmap <leader><leader>k <Plug>(easymotion-overwin-line)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

" FzF
nnoremap <c-g> :GFiles<CR>
nnoremap <c-z> :Files<CR>
nnoremap ?? :Rg<CR>
nnoremap // :BLines<CR>
nnoremap cc :Commands<CR>
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
command! FileHistory execute ":BCommits!"

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --color=always --smart-case -- '.shellescape(<q-args>), 1,fzf#vim#with_preview(), <bang>0)

" Ranger
let g:ranger_map_keys=0
nnoremap <leader>r :Ranger<CR>

" Autoformat
nnoremap F :Autoformat<CR>

" Undotree
nnoremap <C-u> :UndotreeToggle<cr>

" Vimwiki
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/'}]
let g:vimwiki_listsyms = '✗✓'
let g:vimwiki_conceallevel = 2

" Load external files
runtime macros.vim
runtime cocrc.vim
runtime start-screen.vim
