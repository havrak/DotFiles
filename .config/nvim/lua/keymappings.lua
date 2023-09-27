vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Fix indenting visual blocks
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '?', '<gv', { silent = true })
vim.keymap.set('v', ':', '>gv', { silent = true })

-- Binding to get to TERMINAL mode
vim.keymap.set('n', ';', ':', { silent = true })
vim.keymap.set('n', 'ů', ':', { silent = true })

-- Shortcuts for navigation
vim.keymap.set('n', '<C-Left>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { silent = true })

-- Shortcuts for resizing windows
vim.keymap.set('n', '<C-h>', '<Cmd>vertical resize -5<CR>', {silent = true })
vim.keymap.set('n', '<C-j>', '<Cmd>resize +5<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', '<Cmd>resize -5<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', '<Cmd>vertical resize +5<CR>', { silent = true })

-- Working with buffers
vim.keymap.set('n', 'gt', '<Cmd>bnext<CR>', { silent = true })
vim.keymap.set('n', 'gT', '<Cmd>bprevious<CR>', { silent = true })
vim.keymap.set('n', 'Q', function()
	vim.cmd('w!')
	vim.cmd('Bclose')
end, { silent = true })

-- Replace selected text
vim.keymap.set('n', 'S', ':%s///g<Left><Left>')
vim.keymap.set('x', 'S', ':s///g<Left><Left>')

-- Compile document
vim.keymap.set('n', '<leader>c', function()
	vim.cmd('w!')
	vim.cmd('!compiler %')
end, { silent = true })

-- autocmd BufEnter *.wiki nnoremap <leader>c :Vimwiki2HTML<CR>
vim.keymap.set('n', '<leader>p', '<Cmd>!opout "%"<CR>', { silent = true })

-- " Copy selected text to system clipboard
vim.keymap.set('n', 'y', '"+y <Cmd>@*=@+<CR', { silent = true })
vim.keymap.set('n', 'x', '"+x <Cmd>@*=@+<CR', { silent = true })
vim.keymap.set('n', 'p', '"+P', { silent = true })

-- Navigating with guides
vim.keymap.set({'i', 'n', 'v'}, '<C-w>', '<Esc>/<++><Enter>"_c4l')

vim.keymap.set('n', '<F6>',  '<Cmd>TagbarToggle<CR>', {silent = true})
vim.keymap.set('n', 'F',  '<Cmd>Autoformat<CR>', {silent = true})
