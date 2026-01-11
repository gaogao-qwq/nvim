local t = require("telescope")
local tb = require("telescope.builtin")

return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader><space>", false },
		{ "<leader>/", false },
		{ "<leader>ff", tb.find_files, desc = "Telescope search files" },
		{ "<leader>fo", tb.oldfiles, desc = "Telescope search history files" },
		{ "<leader>fg", tb.live_grep, desc = "Telescope search words" },
		{ "<leader>fb", tb.buffers, desc = "Telescope search buffers" },
		{ "<leader>fh", tb.help_tags, desc = "Telescope search helps" },
		{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Telescope search todos" },
		{ "gr", tb.lsp_references, desc = "Lsp references" },
		{ "gd", tb.lsp_definitions, desc = "Lsp definitions" },
		{ "gI", tb.lsp_implementations, desc = "Lsp implementations" },
	},
	opts = function()
		t.load_extension("fzf")
		t.load_extension("flutter")
		t.load_extension("noice")
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
