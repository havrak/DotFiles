local M = {'neoclide/coc.nvim', branch = 'release', event = "VeryLazy"}

function M.config()
	vim.g.coc_global_extensions = {
	'coc-pairs',
	'coc-tsserver',
	'coc-html',
	'coc-css',
	'coc-json',
	'coc-pyright',
	'coc-spell-checker',
	'coc-cspell-dicts',
	'coc-sh',
	'coc-clangd',
	'coc-cmake'}

	-- Autocomplete
	function _G.check_back_space()
		local col = vim.fn.col('.') - 1
		return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
	end

	local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
	-- vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
	-- vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
	vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

	vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

	vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
	vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

	vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
	vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
	vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
	vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})


	function _G.show_docs()
		local cw = vim.fn.expand('<cword>')
		if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
			vim.api.nvim_command('h ' .. cw)
		elseif vim.api.nvim_eval('coc#rpc#ready()') then
			vim.fn.CocActionAsync('doHover')
		else
			vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
		end
	end


	-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
	vim.api.nvim_create_augroup("CocGroup", {})
	vim.api.nvim_create_autocmd("CursorHold", {
		group = "CocGroup",
		command = "silent call CocActionAsync('highlight')",
		desc = "Highlight symbol under cursor on CursorHold"
	})


	-- Symbol renaming
	vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


	-- Formatting selected code
	vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
	vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


	-- Setup formatexpr specified filetype(s)
	vim.api.nvim_create_autocmd("FileType", {
		group = "CocGroup",
		pattern = "typescript,json",
		command = "setl formatexpr=CocAction('formatSelected')",
		desc = "Setup formatexpr specified filetype(s)."
	})

	-- Update signature help on jump placeholder
	vim.api.nvim_create_autocmd("User", {
		group = "CocGroup",
		pattern = "CocJumpPlaceholder",
		command = "call CocActionAsync('showSignatureHelp')",
		desc = "Update signature help on jump placeholder"
	})

	-- Apply codeAction to the selected region
	-- Example: `<leader>aap` for current paragraph
	local opts = {silent = true, nowait = true}

	-- -- Remap keys for apply code actions at the cursor position.
	vim.keymap.set("n", "<C-Space>", "<Plug>(coc-codeaction-cursor)", opts)
	vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

	-- Remap keys for apply refactor code actions.
	vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
	vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
	vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

	-- Run the Code Lens actions on the current line
	vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


	-- Remap <C-f> and <C-b> to scroll float windows/popups
	---@diagnostic disable-next-line: redefined-local
	local opts = {silent = true, nowait = true, expr = true}
	vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
	vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
	vim.keymap.set("i", "<C-f>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
	vim.keymap.set("i", "<C-b>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
	vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
	vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


	-- Use CTRL-S for selections ranges
	-- Requires 'textDocument/selectionRange' support of language server
	vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
	vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


	-- Mappings for CoCList
	-- code actions and coc stuff
	---@diagnostic disable-next-line: redefined-local
	local opts = {silent = true, nowait = true}
	vim.keymap.set("n", "<leader>d", ":<C-u>CocList diagnostics<cr>", opts)
	vim.keymap.set("n", "<space>j", ":<C-u>CocNext<cr>", opts)
	vim.keymap.set("n", "<space>k", ":<C-u>CocPrev<cr>", opts)

end
return M
