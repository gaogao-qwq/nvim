return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader><space>", false },
		{ "<leader>/", false },
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope search files" },
		{ "<leader>fo", require("telescope.builtin").oldfiles, desc = "Telescope search history files" },
		{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Telescope search words" },
		{ "<leader>fb", require("telescope.builtin").buffers, desc = "Telescope search buffers" },
		{ "<leader>fh", require("telescope.builtin").help_tags, desc = "Telescope search helps" },
		{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Telescope search todos" },
	},
	opts = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("flutter")
		require("telescope").load_extension("noice")
		return {
			-- defaults = require("telescope.themes").get_ivy({}),
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
