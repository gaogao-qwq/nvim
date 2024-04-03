return {
	"lukas-reineke/indent-blankline.nvim",
	opts = function()
		local whitespace_highlight = {
			"CursorColumn",
			"Whitespace",
		}

		return {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = true },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
			whitespace = {
				highlight = whitespace_highlight,
				remove_blankline_trail = false,
			},
		}
	end
}
