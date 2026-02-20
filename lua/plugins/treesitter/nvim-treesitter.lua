return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	opts = function()
		if vim.uv.os_uname().sysname == "Darwin" then
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
			},
			ignore_installed = { "org" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "org" },
			},
			indent = { enable = true, disabled = { "dart" } },
			rainbow = {
				enable = true,
				disabled = { "dart" },
				extended_mode = false,
				max_file_lines = 2000,
			},
		}
	end,
}
