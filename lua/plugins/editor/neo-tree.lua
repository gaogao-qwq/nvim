return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			hijack_netrw_behavior = "disabled",
			follow_current_file = { enabled = false },
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree<cr>", desc = "NeoTree" },
	},
}
