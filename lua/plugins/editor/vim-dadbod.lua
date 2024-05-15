return {
	{ "tpope/vim-dadbod",                     event = "VeryLazy" },
	{ "kristijanhusak/vim-dadbod-completion", event = "VeryLazy" },
	{
		"kristijanhusak/vim-dadbod-ui",
		event = "VeryLazy",
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		keys = {
			{ "<leader>uB", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" }
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_win_position = "right"
		end,
	},
}
