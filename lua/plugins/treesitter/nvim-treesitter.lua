return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	opts = function()
		if vim.loop.os_uname().sysname == "Darwin" then
			require("nvim-treesitter.install").compilers = { "gcc-11" }
		end
		return {
			ensure_installed = {
				"vim",
				"vimdoc",
				"bash",
				"c",
				"cpp",
				"make",
				"cmake",
				"just",
				"javascript",
				"jsdoc",
				"typescript",
				"json",
				"lua",
				"luadoc",
				"python",
				"java",
				"go",
				"rust",
				"toml",
				"html",
				"css",
				"scss",
				"vue",
				"dart",
				"markdown",
				"markdown_inline",
				"regex",
				"sql",
			},
			ignore_installed = { "org" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "org" },
			},
			indent = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		}
	end,
}
