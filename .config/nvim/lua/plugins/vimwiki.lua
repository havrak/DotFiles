vim.g.vimwiki_list = {
	{
		path = '$HOME/.config/nvim/vimwiki/',
		path_html =  '~/.config/nvim/vimwiki/html',
		syntax = 'default',
		ext = '.wiki',
		auto_diary_index = 1,
		template_path = '~/.config/nvim/vimwiki/templates'	,
		template_default = 'def_template',
		template_ext = '.html'
	}
}

vim.g.vimwiki_key_mappings = {
	all_maps =  1,
	global = 1,
	headers = 1,
	text_objs = 1,
	table_format = 1,
	table_mappings = 0,
	lists = 1,
	links = 1,
	html = 1,
	mouse = 0,
	lists_return = 0 -- prevents <CR> from being handled by vimwiki
}

local M = {"vimwiki/vimwiki", lazy = false}
function M.config()

	vim.g.vimwiki_listsyms = '✗✓'
	vim.g.vimwiki_conceallevel = 2
	vim.g.vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script,div'

	vim.keymap.set ('n', '<leader><F8>', ':VimwikiIndex<CR>' , {silent = true, noremap = false})
	vim.keymap.set ('n', 'łws', '<Plug>VimwikiSplitLink' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łwv', '<Plug>VimwikiVSplitLink' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łwt', '<Plug>VimwikiTabnewLink' , {noremap = true,silent = true})
	vim.keymap.set ('v', 'łwn', '<Plug>VimwikiNormalizeLinkVisualCR' , {noremap = true,silent = true})
	vim.keymap.set ('n', 'łwn', 'VimwikiReturn' , {noremap = true,silent = true})
	vim.keymap.set ('i', 'łwn', 'VimwikiReturn' , {noremap = true,silent = true})
	vim.keymap.set ('n', '<S-CR>', '<Plug>VimwikiFollowLink'  , {noremap = true,silent = true})

	local vimwiki_group = vim.api.nvim_create_augroup("VimwikiRemaps", {clear = true})
	--
	vim.api.nvim_create_autocmd("BufEnter", {
		group = vimwiki_group,
		pattern = "vimwiki",
		callback = function()
			vim.keymap.set ('i',  '<M-n>', 'vimwiki#tbl#kbd_tab()' , {noremap = true,silent = true})
			vim.keymap.set ('i',  '<M-p>', 'vimwiki#tbl#kbd_shift_tab()' , {noremap = true,silent = true})
			vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "<C-]><Esc>:VimwikiReturn 1 5<CR>"]], {noremap = true,silent = true, expr = true})
			vim.keymap.set("n", "<leader>c", ':Vimwiki2HTML<CR>', {silent = true, noremap = false})
		end,
	})

end

return M
