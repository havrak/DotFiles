local M = {}
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = { focusable = false, border = "rounded", source = "if_many" },
})
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

vim.lsp.config(
	"*",
	{ capabilities = require("cmp_nvim_lsp").default_capabilities() }
	-- { textDocument = { foldingRange = { dynamicRegistration = false, lineFoldingOnly = true } } }
)

local function setup(server, opts)
	opts = type(opts) == "table" and opts or require("mylsp." .. (opts or server))
	if not server then
		return opts
	end

	local on_attach = opts.on_attach
	opts.on_attach = function(client, bufnr)
		vim.bo.formatoptions = "tcqjl1"
		-- custom settings for dynamic capability override
		if client.server_capabilities.documentFormattingProvider then
			client.server_capabilities.documentFormattingProvider = opts.format ~= false
		end
		if opts.setCwd ~= false then
			local bname = vim.api.nvim_buf_get_name(bufnr)
			for _, ws in ipairs(client.config.workspace_folders or {}) do
				ws = ws.name
				if ws and bname:sub(1, #ws) == ws then
					vim.b[bufnr].cwd = ws
					vim.api.nvim_set_current_dir(ws)
					break
				end
			end
		end

		if on_attach then
			on_attach(client, bufnr)
		end
	end

	if opts.root_markers then
		vim.list_extend(opts.root_markers, vim.lsp.config[server].root_markers)
	end
	opts = vim.tbl_deep_extend("keep", opts, vim.lsp.config[server])
	vim.lsp.config(server, opts)
	vim.lsp.enable(server)
	return opts
end
M.setup = setup

setup("bashls")
setup("pyright")
-- setup('tsserver')
setup("jsonls")
setup("clangd")
setup("cspell_ls")
setup("lua_ls")

-- Lsp diagnostic
vim.keymap.set("n", "<C-d>", vim.diagnostic.open_float)
vim.keymap.set("i", "<A-d>s", vim.diagnostic.open_float)
vim.keymap.set("n", "[g", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
vim.keymap.set("n", "]g", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
-- Lsp code helpers gd,gr... in ../plugins/fzf.lua
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", function()
	vim.lsp.buf.references()
end)
vim.keymap.set({ "n", "i" }, "<A-i>", function()
	vim.lsp.buf.hover({ border = "rounded" })
end)
vim.keymap.set("i", "<A-I>", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
vim.keymap.set({ "n", "i" }, "<C-i>", vim.lsp.buf.document_highlight)
vim.keymap.set({ "n", "i" }, "<C-S-I>", vim.lsp.buf.clear_references)
vim.keymap.set({ "n", "i" }, "<c-space>", vim.lsp.buf.code_action)
vim.keymap.set({ "n", "i" }, "<C-r>", vim.lsp.buf.rename)

return M
