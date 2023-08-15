vim.g.vimwiki_list = {
	{
		path = '$HOME/.config/nvim/vimwiki/',
		path_html =  '~/.config/nvim/vimwiki/html',
		auto_diary_index = 1,
		template_path = '~/.config/nvim/vimwiki/templates'	,
		template_default = 'def_template',
		template_ext = '.html'
	}
}

local M = {"vimwiki/vimwiki", lazy = false}
function M.config()

	vim.g.vimwiki_listsyms = '✗✓'
	vim.g.vimwiki_conceallevel = 2
	vim.g.vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script,div'

	local vimwiki_group = vim.api.nvim_create_augroup("VimwikiRemaps", {clear = true})
	--
	vim.api.nvim_create_autocmd("FileType", {
		group = vimwiki_group,
		pattern = "vimwiki",
		callback = function()
			vim.cmd("iunmap <buffer> <Tab>")
			vim.keymap.set ('i',  '<M-n>', 'vimwiki#tbl#kbd_tab()' , {noremap = true,silent = true})
			vim.keymap.set ('i',  '<M-p>', 'vimwiki#tbl#kbd_shift_tab()' , {noremap = true,silent = true})
			vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false})
		end,
	})
	vim.keymap.set ('n', '<F8>', ':VimwikiIndex<CR>' , {silent = true, noremap = false})
	vim.keymap.set ('n', 'łwf', '<Plug>VimwikiFollowLink' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łws', '<Plug>VimwikiSplitLink' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łwv', '<Plug>VimwikiVSplitLink' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łwt', '<Plug>VimwikiTabnewLink' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łwn', '<Plug>VimwikiNormalizeLinkVisualCR' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łwn', 'VimwikiReturn' , {noremap = true,silent = true})
	vim.keymap.set ('n', '<S-CR>', '<Plug>VimwikiFollowLink'  , {noremap = true,silent = true})

end

return M
