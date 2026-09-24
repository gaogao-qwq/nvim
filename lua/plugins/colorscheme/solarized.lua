return {
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	---@type solarized.config
	opts = {
		variant = "spring",
		on_highlights = function(colors, _)
			---@type solarized.highlights
			return {
				LspReferenceText = { fg = "NONE" },
				LspReferenceRead = { fg = "NONE" },
				LspReferenceWrite = { fg = "NONE", bold = true },
				CursorLineNr = { bg = vim.api.nvim_get_hl(0, { name = "CursorLine", link = true }).bg },
				FoldColumn = { bg = "None" },
				Visual = { fg = "NONE" },
			}
		end,
	},
	config = function(_, opts)
		vim.o.termguicolors = true
		vim.o.background = "dark"
		require("solarized").setup(opts)
		vim.cmd.colorscheme("solarized")
	end,
}
