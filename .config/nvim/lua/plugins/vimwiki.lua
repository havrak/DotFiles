local M = {'vimwiki/vimwiki', event = "VeryLazy"}

function M.config()

	vim.api.nvim_exec([[
	let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/', 'path_html': '~/.config/nvim/vimwiki/html', "auto_diary_index": 1,'template_path': '~/.config/nvim/vimwiki/templates','template_default': 'def_template', 'template_ext': '.html'}]
	let g:vimwiki_listsyms = '✗✓'
	let g:vimwiki_conceallevel = 2
	let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script,div'

	augroup VimwikiRemaps
	autocmd!
	autocmd Filetype vimwiki silent! iunmap <buffer> <Tab>
	autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-n> vimwiki#tbl#kbd_tab()
	autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-p> vimwiki#tbl#kbd_shift_tab()
	autocmd Filetype vimwiki inoremap <silent><expr><buffer> <cr> coc#pum#visible() ? coc#_select_confirm()
	\: "<C-]><Esc>:VimwikiReturn 1 5<CR>"
	augroup end

	]], false)

vim.keymap.set ('n',  '<leader><F8>', ':VimwikiIndex<CR>' , {silent = true})
vim.keymap.set ('n', 'łwf', '<Plug>VimwikiFollowLink' , {noremap = true,silent = true})
vim.keymap.set ('n',  'łws', '<Plug>VimwikiSplitLink' , {noremap = true,silent = true})
vim.keymap.set ('n',  'łwv', '<Plug>VimwikiVSplitLink' , {noremap = true,silent = true})
vim.keymap.set ('n',  'łwt', '<Plug>VimwikiTabnewLink' , {noremap = true,silent = true})
vim.keymap.set ('n',  'łwn', '<Plug>VimwikiNormalizeLinkVisualCR' , {noremap = true,silent = true})
vim.keymap.set ('n',  'łwn', 'VimwikiReturn' , {noremap = true,silent = true})
vim.keymap.set ('n',  '<S-CR>', '<Plug>VimwikiFollowLink'  , {noremap = true,silent = true})

end
return M
