
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
-- vim.o.expandtab = true
vim.o.encoding = 'utf-8'
vim.g.termencoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.clipboard = 'unnamedplus'
vim.wo.signcolumn = 'yes'
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.cmdheight = 1
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.hidden = true
vim.o.autoindent = true

vim.o.smartindent = true
vim.o.incsearch = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.undofile= true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.history = 5000
vim.o.updatetime = 250
vim.o.timeoutlen = 1000
vim.lsp.set_log_level(5) -- turn off
-- vim.opt.spelllang = { 'en_us' , 'cs', 'de'}
vim.opt.spelllang = { 'en_us' , 'cs'}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

