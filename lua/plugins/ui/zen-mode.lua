return {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>uz",
			function()
				require("zen-mode").toggle({ window = { width = 0.75 } })
			end,
			desc = "Toggle Zen Mode",
		},
	},
	opts = {
		plugins = {
			twilight = { enabled = false },
			tmux = { enabled = true },
			kitty = { enabled = true, font = "+2" },
		},
	},
}
