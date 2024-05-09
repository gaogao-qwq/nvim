return {
	"brenton-leighton/multiple-cursors.nvim",
	event = "VeryLazy",
	version = "*",
	opts = {},
	keys = {
		{ "<C-M-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" } },
		{ "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" } },
		{ "<C-M-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" } },
		{ "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" } },
		{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" } },
		{ "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" } },
	},
}
