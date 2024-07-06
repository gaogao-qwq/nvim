return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			follow_current_file = { enabled = false },
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree<cr>", desc = "NeoTree" },
	},
}
