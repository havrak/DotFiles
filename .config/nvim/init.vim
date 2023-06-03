if exists('g:vscode')
	runtime vscode.vim
	finish
endif

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
Plug 'aperezdc/vim-template'                                " template support in vim
Plug 'honza/vim-snippets'
" Git
Plug 'rhysd/git-messenger.vim'															" displays commit message from commit that affected the line (on <leader>gm)
Plug 'airblade/vim-rooter'																	" work in current git repository
" Syntax highlighting
Plug 'morhetz/gruvbox'																			" gruvbox color scheme used by vim
Plug 'nvim-treesitter/nvim-treesitter'											" complex syntax highlighting engine to replace vim default
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }		" color hex codes will display corresponding color
" Writing, text editing
Plug 'vimwiki/vimwiki'																			" note-organizing tool in vim, org mode like
Plug 'tpope/vim-commentary'																	" easy commenting
Plug 'brooth/far.vim'																				" find and replace across multiple files
Plug 'Chiel92/vim-autoformat'																" autoformats file, normally use CoC feature
Plug 'dhruvasagar/vim-table-mode'														" makes markdown tables less infuriating
Plug 'github/copilot.vim'
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
set undodir="~/.config/nvim/undo/"
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
noremap y "+y :let @*=@+<CR>
noremap x "+x :let @*=@+<CR>
noremap p "+P

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Run command on update of certain files
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

noremap <F1> <Plug>AirlineSelectTab1
noremap <F2> <Plug>AirlineSelectTab2
noremap <F3> <Plug>AirlineSelectTab3
noremap <F4> <Plug>AirlineSelectTab4
noremap <F5> <Plug>AirlineSelectTab5
noremap <F6> <Plug>AirlineSelectTab6
noremap <F7> <Plug>AirlineSelectTab7
noremap <F8> <Plug>AirlineSelectTab8
noremap <F9> <Plug>AirlineSelectTab9
noremap <F10> <Plug>AirlineSelectTab0

" Vim Hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla']
let g:Hexokinase_highlighters = ['backgroundfull']
autocmd BufEnter * HexokinaseTurnOn

" Special highlighting
hi DELETE			term=bold	guibg=#fb4934 guifg=#1a1a1a ctermfg=black ctermbg=red
hi TODO				term=bold	guibg=#fabd2f	guifg=#1a1a1a ctermfg=black ctermbg=yellow
hi NOTE				term=bold	guibg=#83a598	guifg=#1a1a1a ctermfg=black ctermbg=blue
hi IMPORTANT	term=bold	guibg=#fb4934	guifg=#1a1a1a ctermfg=black ctermbg=red
hi OPTIONAL		term=bold	guibg=#98971a guifg=#1a1a1a ctermfg=black ctermbg=green
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

" Vimwiki
let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/', 'path_html': '~/.config/nvim/vimwiki/html', "auto_diary_index": 1,'template_path': '~/.config/nvim/vimwiki/templates','template_default': 'def_template', 'template_ext': '.html'}]
let g:vimwiki_listsyms = '✗✓'
let g:vimwiki_conceallevel = 2
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script,div'
nmap <leader><F8> :VimwikiIndex<CR>

nnoremap łwf <Plug>VimwikiFollowLink
nnoremap łws <Plug>VimwikiSplitLink
nnoremap łwv <Plug>VimwikiVSplitLink
nnoremap łwv <Plug>VimwikiTabnewLink
vnoremap łwn <Plug>VimwikiNormalizeLinkVisualCR
inoremap łwn VimwikiReturn
nnoremap <S-CR> <Plug>VimwikiFollowLink


augroup VimwikiRemaps
    autocmd!
    autocmd Filetype vimwiki silent! iunmap <buffer> <Tab>
    autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-n> vimwiki#tbl#kbd_tab()
    autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-p> vimwiki#tbl#kbd_shift_tab()
    autocmd Filetype vimwiki inoremap <silent><expr><buffer> <cr> coc#pum#visible() ? coc#_select_confirm()
                              \: "<C-]><Esc>:VimwikiReturn 1 5<CR>"
augroup end

" vim-rooter
let g:rooter_patterns = ['.git', '.hg', '.bzr', '.svn']

" vim-template
let g:templates_directory= '~/.config/nvim/templates'
let g:templates_no_autocmd = 0

" Trees
nnoremap <leader><F6> :TagbarToggle<CR>
nnoremap <leader><F4> :NvimTreeToggle<CR>

autocmd FileType arduino setlocal commentstring=\/*\ %s*\/
" CoC
let g:coc_global_extensions = [
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
			\ ]

" Copilot
let g:copilot_enabled = v:true
autocmd Filetype vimwiki let g:copilot_enabled = v:false

" Load external files
runtime macros.vim
runtime start-screen.vim

lua require('coc')
lua require('nvimtree')
lua require('treesitter')
