require'nvim-treesitter.configs'.setup {
	ensure_installed = { "vim", "bash", "c", "cpp", "cmake", "javascript", "typescript", "json",
		"lua", "python", "java", "go", "rust", "html", "css", "scss", "vue", "dart" },

	highlight = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}
