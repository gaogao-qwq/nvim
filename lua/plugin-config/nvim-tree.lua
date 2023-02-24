-- 默认不开启 nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_metrwPlugin = 1
require('nvim-tree').setup({
	view = {
		float = {
			enable = true,
			open_win_config = function()
				local columns = vim.o.columns
				local lines = vim.o.lines
				local width = math.max(math.floor(columns * 0.5), 50)
				local height = math.max(math.floor(lines * 0.5), 20)
				local left = math.ceil((columns - width) * 0.5)
				local top = math.ceil((lines - height) * 0.5 - 2)
				return { relative = "editor", border = "rounded", width = width, height = height, row = top, col = left }
			end,
		},
	},
})
