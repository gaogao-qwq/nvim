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
	"sumneko_lua",
	"clangd",
	"tsserver",
	"tailwindcss",
	"bashls",
	"cssls",
	"dockerls",
	"emmet_ls",
	"html",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"taplo",
	"yamlls",
	"gopls",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").sumneko_lua.setup {
	capabilities = capabilities,
}

require("lspconfig").clangd.setup {
	capabilities = capabilities,
}

require("lspconfig").pyright.setup {
	capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
	capabilities = capabilities,
}
