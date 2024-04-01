local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

lspconfig.lua_ls.setup {
	capabilities = capabilities,
}

lspconfig.asm_lsp.setup {
	capabilities = capabilities,
}

lspconfig.clangd.setup {
	capabilities = capabilities,
}

lspconfig.pyright.setup {
	capabilities = capabilities,
}

lspconfig.gopls.setup {
	capabilities = capabilities,
}

lspconfig.html.setup {
	filetypes = {
		'html',
		'php',
	},
	capabilities = capabilities,
}

lspconfig.cssls.setup {
	capabilities = capabilities,
}

lspconfig.eslint.setup {
	capabilities = capabilities,
}

lspconfig.volar.setup{
	filetypes = {
		'typescript',
		'javascript',
		'javascriptreact',
		'typescriptreact',
		'vue',
	},
	init_options = {
		languageFeatures = {
			implementation = true,
			references = true,
			definition = true,
			typeDefinition = true,
			callHierarchy = true,
			hover = true,
			rename = true,
			renameFileRefactoring = true,
			signatureHelp = true,
			codeAction = true,
			workspaceSymbol = true,
			completion = {
				defaultTagNameCase = 'kebabCase',
				defaultAttrNameCase = 'kebabCase',
				getDocumentNameCasesRequest = false,
				getDocumentSelectionRequest = false,
			},
		},
		capabilities = capabilities,
	}
}

lspconfig.jsonls.setup {
	capabilities = capabilities,
}

lspconfig.bashls.setup {
	capabilities = capabilities,
}

lspconfig.ltex.setup {
	filetypes = { "plaintex", "tex", "markdown", "org" },
	capabilities = capabilities,
}

lspconfig.neocmake.setup {
	capabilities = capabilities,
}

lspconfig.kotlin_language_server.setup {
	capabilities = capabilities,
}

lspconfig.intelephense.setup {
	capabilities = capabilities,
}

