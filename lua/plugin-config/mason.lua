require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"asm_lsp",
		"volar",
		"tailwindcss",
		"bashls",
		"cssls",
		"html",
		"eslint",
		"jsonls",
		"pyright",
		"rust_analyzer",
		"gopls",
		"ltex",
		"neocmake",
		"kotlin_language_server",
	},
})

