let g:coc_disable_startup_warning = 1

let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-prettier',
			\ 'coc-tsserver',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-json',
			\ 'coc-angular',
			\ 'coc-vimtex',
			\ 'coc-java',
			\ 'coc-vimlsp',
			\ 'coc-pyright',
			\ 'coc-spell-checker',
			\ 'coc-cspell-dicts',
			\ 'coc-sh',
			\ 'coc-emmet',
			\ 'coc-yaml',
			\ 'coc-clangd',
			\ 'coc-cmake',
			\ ]

" From Coc Readme
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
autocmd FileType vimwiki inoremap <expr> <c-w> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>" " vimwiki interefears with selection, its keymap has higher priority

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

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

augroup mygroup
	autocmd!
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  vw<Plug>(coc-codeaction-selected)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
