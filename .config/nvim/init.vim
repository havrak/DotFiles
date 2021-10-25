let mapleader =" "

call plug#begin('~/.config/nvim/plugged')
" Airline
Plug 'bling/vim-airline'																		" feature packed status line
Plug 'vim-airline/vim-airline-themes'												" themes for airline
" Files
Plug 'junegunn/fzf.vim'																			" fuzzy finder integration in vim
Plug 'rbgrouleff/bclose.vim'																" closes buffer without closing window, same y Q mapping but necessary for ranger plugins
Plug 'kyazdani42/nvim-web-devicons'													" for file icons
Plug 'kyazdani42/nvim-tree.lua'															" file browser for vim
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}							" Code completion and much more
Plug 'honza/vim-snippets'																		" buch of snippets to work with CoC
Plug 'lervag/vimtex'																				" supplies latex support for CoC
Plug 'aperezdc/vim-template'                                " template support in vim, since CoC plugin got deprected
" Git
Plug 'airblade/vim-gitgutter'                               " shows changes in signcolumn
Plug 'tpope/vim-fugitive'																		" better integration with git commands
Plug 'tpope/vim-rhubarb'																		" enables GBrowse - opens file in github
Plug 'rhysd/git-messenger.vim'															" displays commit message from commit that affected the line (on <leader>gm)
Plug 'airblade/vim-rooter'																	" work in current git repository
" Motions
Plug 'easymotion/vim-easymotion'														" enables new ways to move through file
Plug 'preservim/tagbar'																			" navigate via sections (usually used in LaTeX)
" Syntax highlighting
Plug 'morhetz/gruvbox'																			" gruvbox color scheme used by vim
Plug 'nvim-treesitter/nvim-treesitter' 											" complex syntax highlighting engine to replace vim default
Plug 'kovetskiy/sxhkd-vim'																	" highlighting for sxhkd configuration
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }		" color hex codes will display corresponding color
Plug 'pangloss/vim-javascript'
" Note taking
Plug 'vimwiki/vimwiki'																			" note-organizing tool in vim, org mode like
" Writing, text editing
Plug 'tpope/vim-commentary'																	" easy commenting
Plug 'mbbill/undotree'																			" complex undo enables moving to already rewritten changes
Plug 'brooth/far.vim'																				" find and replace across multiple files
Plug 'Chiel92/vim-autoformat'																" autoformats file, normally use CoC feature
Plug 'dhruvasagar/vim-table-mode'														" makes markdown tables less infuriating
" Programming
Plug 'stevearc/vim-arduino'																	" compiling and uploading programs to arduino
" Misc
Plug 'mhinz/vim-startify'																		" gives vim pretty start screen, manages stored vim sessions
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
set nowritebackup
set noswapfile
set linebreak
set breakindent
set hidden
set autoindent
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javascript_fold=1 "activate folding by JS syntax
let python_fold=1
set foldlevelstart=1 "start file with all folds opened
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
nnoremap Q :w\|Bclose<CR>
tnoremap <Esc> <C-\><C-n>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left>
xnoremap S :%s///g<Left><Left>

" Compile document
nnoremap <leader>c :w! \| !compiler <c-r>%<CR>
autocmd BufEnter *.wiki nnoremap <leader>c :Vimwiki2HTML<CR>

" Open corresponding .pdf/.html or preview
nnoremap <leader>p :!opout "%"<CR><CR>

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
autocmd BufWritePost ~/.config/fish/config.fish,~/.config/fish/abbreviations.fish !rm ~/.config/fish/fish_variables

" Navigating with guides
inoremap	<C-w> <Esc>/<++><Enter>"_c4l
vnoremap	<C-w> <Esc>/<++><Enter>"_c4l
nnoremap	<C-w> <Esc>/<++><Enter>"_c4l

" Custom commands
command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"

" Special highlighting
hi DELETE			term=bold	guibg=#fb4934 guifg=#121212 ctermfg=black ctermbg=red
hi TODO				term=bold	guibg=#fabd2f	guifg=#121212 ctermfg=black ctermbg=yellow
hi NOTE				term=bold	guibg=#83a598	guifg=#121212 ctermfg=black ctermbg=blue
hi IMPORTANT	term=bold	guibg=#fb4934	guifg=#121212 ctermfg=black ctermbg=red
hi OPTIONAL		term=bold	guibg=#98971a guifg=#121212 ctermfg=black ctermbg=green
call matchadd('DELETE', 'DELETE')
call matchadd('TODO','TODO')
call matchadd('NOTE','NOTE')
call matchadd('IMPORTANT', 'IMPORTANT')
call matchadd('OPTIONAL', 'OPTIONAL')

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnametruncate = 30
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|markdown.pandoc|org|rst|tex|text|wiki'
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#whitespace#enabled= 0

" Vim Hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla']
let g:Hexokinase_highlighters = ['backgroundfull']
autocmd BufEnter * HexokinaseTurnOn

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
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
command! FileHistory execute ":BCommits!"

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --color=always --smart-case -- '.shellescape(<q-args>), 1,fzf#vim#with_preview(), <bang>0)

" Autoformat
nnoremap <leader>F :Autoformat<CR>

" Vimtex
let g:tex_stylish = 1
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:tex_isk='48-57,a-z,A-Z,192-255,:'

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
			\ 'markers' : {'enabled': 0},
			\ 'sections' : {'parse_levels': 1},
			\}
let g:vimtex_format_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_automatic = 0
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_toc_config = {
			\ 'split_pos' : 'full',
			\ 'mode' : 2,
			\ 'fold_enable' : 1,
			\ 'hotkeys_enabled' : 1,
			\ 'hotkeys_leader' : '',
			\ 'refresh_always' : 0,
			\}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_imaps_enabled = 1
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_complete_bib = {
			\ 'simple' : 1,
			\ 'menu_fmt' : '@year, @author_short, @title',
			\}
let g:vimtex_echo_verbose_input = 0

" Vimwiki
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/', 'path_html': '~/.vim/vimwiki/html', "auto_diary_index": 1,
			\ 'template_path': '~/.vim/vimwiki/templates',
			\ 'template_default': 'def_template',
			\ 'template_ext': '.html'}]
let g:vimwiki_listsyms = '✗✓'
let g:vimwiki_conceallevel = 2
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

" vim-rooter
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git', '.hg', '.bzr', '.svn']

" vim-template
let g:templates_directory= '/home/havra/.vim/templates'
let g:templates_no_autocmd = 1

" Trees
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F4> :NvimTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

" Load external files
runtime macros.vim
runtime cocrc.vim
runtime start-screen.vim

lua require('nv-nvimtree')
lua require('nv-treesitter')
