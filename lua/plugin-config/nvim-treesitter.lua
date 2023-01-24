require'nvim-treesitter.configs'.setup {
	ensure_installed = { "vim", "help", "bash", "c", "cpp", "cmake", "javascript", "json",
		"lua", "python", "java", "go", "rust", "html", "css" },
	
	highlight = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}
