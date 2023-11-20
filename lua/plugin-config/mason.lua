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
		"clangd",
		"tsserver",
		"volar",
		"tailwindcss",
		"bashls",
		"cssls",
		"html",
		"jsonls",
		"pyright",
		"rust_analyzer",
		"gopls",
		"ltex",
		"neocmake",
		"kotlin_language_server",
	},
})

