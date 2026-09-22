local M = { "preservim/tagbar", event = "VeryLazy" }

function M.config()
	vim.g.tagbar_compact = 1
	vim.g.tagbar_sort = 0

	vim.g.tagbar_type_typst = {
		ctagstype = "Typst",
		ctagsbin = vim.fn.expand("~/bin/scripts/tools/typst2ctags.py"),
		ctagsargs = "-f - --sort=yes",
		kinds = {
			"c:chapter:0:1",
			"s:section:0:1",
			"u:subsection:0:1",
			"b:subsubsection:0:1",
		},
		sro = "»",
		kind2scope = {
			c = "chapter",
			s = "section",
			u = "subsection",
			b = "subsubsection",
		},
		scope2kind = {
			chapter = "c",
			section = "s",
			subsection = "u",
			subsubsection = "b",
		},
		sort = 0,
	}
end

return M
