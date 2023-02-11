vim.opt.termguicolors = true

require("bufferline").setup {
	options = {
		-- 使用 nvim 内置 lsp
		diagnostics = "nvim_lsp",
		-- 左侧让出 nvim-tree 位置
		offsets = {{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left"
		}}
	}
}
