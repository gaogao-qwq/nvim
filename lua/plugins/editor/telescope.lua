return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader><space>", false },
		{ "<leader>/", false },
	},
	opts = function()
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("flutter")
		require("telescope").load_extension("noice")
		return {
			defaults = require("telescope.themes").get_dropdown({}),
			pickers = {},
			extensions = {
				file_browser = {
					hijack_netrw = true,
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				live_grep_args = {
					auto_quoting = true,
				},
			},
		}
	end,
}
