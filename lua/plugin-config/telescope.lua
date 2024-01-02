require('telescope').setup({
	defaults = require('telescope.themes').get_dropdown({}),
	pickers = {},
	extensions = {
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
    	},
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
										     -- the default case_mode is "smart_case"
		},
		live_grep_args = {
			auto_quoting = true
		}
	}
})

require('telescope').load_extension('file_browser')
require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
require("telescope").load_extension("flutter")
require("telescope").load_extension("noice")
