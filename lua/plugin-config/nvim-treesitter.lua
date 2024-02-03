require'nvim-treesitter.configs'.setup {
	ensure_installed = { "vim", "bash", "c", "cpp", "make", "cmake", "javascript", "typescript", "json",
		"lua", "python", "java", "go", "rust", "html", "css", "scss", "vue", "dart", "org" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "org" },
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}

if vim.loop.os_uname().sysname == "Darwin" then
	require"nvim-treesitter.install".compilers = {"gcc-11"}
end
