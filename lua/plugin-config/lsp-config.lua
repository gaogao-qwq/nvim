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
		"jdtls",
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

require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

require("lspconfig").jsonls.setup {
	capabilities = capabilities,
}

require("lspconfig").bashls.setup {
	capabilities = capabilities,
}

require("lspconfig").tsserver.setup {
	capabilities = capabilities,
}

require("lspconfig").ltex.setup {
	capabilities = capabilities,
}

require("lspconfig").neocmake.setup {
	capabilities = capabilities,
}

require("lspconfig").jdtls.setup {
	capabilities = capabilities,
	root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "pom.xml", "gradlew", "settings.gradle", "settings.gradle.kts"),
}
