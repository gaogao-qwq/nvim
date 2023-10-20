-- 默认不开启 nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_metrwPlugin = 1

-- 使用 termguicolors 高亮
vim.opt.termguicolors = true

require('nvim-tree').setup({
	renderer = {
		indent_markers = {
			enable = true
		}
	},
	actions = {
		open_file = {
			quit_on_open = true
		}
	}
})
