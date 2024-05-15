return {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>uz",
			function()
				require("zen-mode").toggle({ window = { width = 0.85 } })
			end,
			desc = "Toggle Zen Mode",
		},
	},
}
