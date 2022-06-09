let mapleader =" "

call plug#begin('~/.config/nvim/plugged')
" Environnement
Plug 'bling/vim-airline'																		" feature packed status line
Plug 'mhinz/vim-startify'																		" gives vim pretty start screen, manages stored vim sessions
Plug 'preservim/tagbar'																			" navigate via sections, functions
" Files
Plug 'junegunn/fzf.vim'																			" fuzzy finder integration in vim
Plug 'kyazdani42/nvim-web-devicons'													" for file icons
Plug 'kyazdani42/nvim-tree.lua'															" file browser for vim
Plug 'rbgrouleff/bclose.vim'																" close buffer
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}							" Code completion and much more
Plug 'honza/vim-snippets'																		" buch of snippets to work with CoC
Plug 'lervag/vimtex' 																				" completion, highlighting, folds
Plug 'aperezdc/vim-template'                                " template support in vim
" Git
Plug 'rhysd/git-messenger.vim'															" displays commit message from commit that affected the line (on <leader>gm)
Plug 'airblade/vim-rooter'																	" work in current git repository
" Syntax highlighting
Plug 'morhetz/gruvbox'																			" gruvbox color scheme used by vim
Plug 'nvim-treesitter/nvim-treesitter'											" complex syntax highlighting engine to replace vim default
Plug 'kovetskiy/sxhkd-vim'																	" highlighting for sxhkd configuration
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }		" color hex codes will display corresponding color
" Writing, text editing
Plug 'vimwiki/vimwiki'																			" note-organizing tool in vim, org mode like
Plug 'tpope/vim-commentary'																	" easy commenting
Plug 'brooth/far.vim'																				" find and replace across multiple files
Plug 'Chiel92/vim-autoformat'																" autoformats file, normally use CoC feature
Plug 'dhruvasagar/vim-table-mode'														" makes markdown tables less infuriating
" Programming
Plug 'stevearc/vim-arduino'																	" compiling and uploading programs to arduino
Plug 'github/copilot.vim'                                   " github copilot for vim
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
set cursorcolumn
set nobackup
set nowritebackup
set noswapfile
set wrap
set linebreak
set breakindent
set hidden
set autoindent
set smartindent
set foldmethod=syntax   "syntax highlighting items specify folds
set foldcolumn=1        "defines 1 col at window left, to indicate folding
let python_fold=1
set incsearch
set smartindent
set splitright
set splitbelow
set undofile
set shortmess+=c
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

" setting up varialbes to be used in templates
let g:email="krystof@havrak.xyz"
let g:username="Havránek Kryštof"

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

" Typing
noremap <leader>o :setlocal spell! spelllang=en_us,cs,de <CR>
autocmd FileType mail :setlocal textwidth=0

" Shortcutting navigation
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

nnoremap <C-h> :vertical resize -5<CR>
nnoremap <C-j> :resize -5<CR>
nnoremap <C-k> :resize +5<CR>
nnoremap <C-l> :vertical resize +5<CR>

noremap <silent> <S-Up> gk
noremap <silent> <S-Down> gj

" Make buffers more practical
nnoremap gt :bnext<CR>
nnoremap gT :bprevious<CR>
nnoremap Q	:w\|Bclose<CR>
nnoremap <C-q> :Bclose!<CR>
tnoremap <Esc> <C-\><C-n>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left>
xnoremap S :s///g<Left><Left>

" Compile document
nnoremap <leader>c :w! \| !compiler <c-r>%<CR>
autocmd BufEnter *.wiki nnoremap <leader>c :Vimwiki2HTML<CR>

" Open corresponding .pdf/.html or preview
nnoremap <leader>p :!opout "%"<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Copy selected text to system clipboard
noremap y "*y :let @+=@*<CR>
noremap x "*x :let @+=@*<CR>
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
nnoremap	<C-w> <Esc>/<++><Enter>"_c4l
vnoremap	<C-w> <Esc>/<++><Enter>"_c4l

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnametruncate = 30
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|markdown.pandoc|org|rst|tex|text|wiki'
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#whitespace#enabled= 0

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

" Vim Hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla']
let g:Hexokinase_highlighters = ['backgroundfull']
autocmd BufEnter * HexokinaseTurnOn

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

" FzF
nnoremap <c-g> :GFiles<CR>
nnoremap <c-z> :Files<CR>
nnoremap // :BLines<CR>
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

command! FileHistory execute ":BCommits!"
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)

" Autoformat
nnoremap <leader>F :Autoformat<CR>
let g:formatdef_latexindent = '"latexindent --logfile=/dev/null --local=$HOME/.config/latexindent/config.yaml -"'

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_indent_enabled = 0
let g:vimtex_indent_bib_enabled = 0

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = { 'markers' : {'enabled': 0}, 'sections' : {'parse_levels': 1},}

" Vimwiki
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/', 'path_html': '~/.vim/vimwiki/html', "auto_diary_index": 1,'template_path': '~/.vim/vimwiki/templates','template_default': 'def_template', 'template_ext': '.html'}]
let g:vimwiki_listsyms = '✗✓'
let g:vimwiki_conceallevel = 2
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script,div'

" vim-rooter
let g:rooter_patterns = ['.git', '.hg', '.bzr', '.svn']

" vim-template
let g:templates_directory= '/home/havra/.vim/templates'
let g:templates_no_autocmd = 0

" Trees
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F4> :NvimTreeToggle<CR>

" CoC
let g:coc_disable_startup_warning = 1

let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-json',
			\ 'coc-vimlsp',
			\ 'coc-pyright',
			\ 'coc-spell-checker',
			\ 'coc-cspell-dicts',
			\ 'coc-sh',
			\ 'coc-clangd',
			\ 'coc-cmake',
			\ 'coc-vimtex',
			\ ]

" From Coc Readme
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
au filetype vimwiki silent! iunmap <buffer> <CR>

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  vw<Plug>(coc-codeaction-selected)

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CmdwinEnter * inoremap <CR> <CR>
autocmd BufReadPost quickfix inoremap <CR> <CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" GitHub copilot
autocmd Filetype vimwiki let g:copilot_enabled = v:false

" Load external files
runtime macros.vim
runtime start-screen.vim

lua require('nv-nvimtree')
lua require('nv-treesitter')
