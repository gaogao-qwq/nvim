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
	"tailwindcss",
	"bashls",
	"cssls",
	"html",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"gopls",
	"ltex",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup {
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

require("lspconfig").gopls.setup {
	capabilities = capabilities,
}

require("lspconfig").html.setup {
	capabilities = capabilities,
}

require("lspconfig").cssls.setup {
	capabilities = capabilities,
}

require("lspconfig").tsserver.setup {
	capabilities = capabilities,
}

require("lspconfig").ltex.setup {
	capabilities = capabilities,
}
