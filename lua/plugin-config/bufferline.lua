require("bufferline").setup {
	options = {
		-- 使用 nvim 内置 lsp
		diagnostics = "nvim_lsp",
		-- 标签编号
		numbers = function(opts)
			return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
		end,
		offsets = {
			filetype = "neo-tree",
			text = "Neo-tree",
			highlight = "Directory",
			text_align = "left"
		}
	}
}
