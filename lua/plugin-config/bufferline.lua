require("bufferline").setup {
	options = {
		-- 使用 nvim 内置 lsp
		diagnostics = "nvim_lsp",
		-- 标签编号
		numbers = function(opts)
			return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
		end,
		-- 左侧让出 nvim-tree 位置
		offsets = {{
			filetype = "NvimTree",
			text = "Nvim Tree",
			highlight = "Directory",
			text_align = "center"
		}}
	}
}
