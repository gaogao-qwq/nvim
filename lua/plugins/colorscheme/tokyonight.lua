return {
	"folke/tokyonight.nvim",
	lazy = true,
	priority = 1000,
	init = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
	opts = {
		transparent = not vim.g.neovide,
		style = "night",
		styles = {
			sidebars = not vim.g.neovide and "transparent" or "dark",
			floats = not vim.g.neovide and "transparent" or "dark",
		},
	},
}
