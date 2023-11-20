local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")

lspconfig.lua_ls.setup {
	capabilities = capabilities,
}

lspconfig.clangd.setup {
	capabilities = capabilities,
}

lspconfig.pyright.setup {
	capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
}

lspconfig.gopls.setup {
	capabilities = capabilities,
}

lspconfig.html.setup {
	capabilities = capabilities,
}

lspconfig.cssls.setup {
	capabilities = capabilities,
}

lspconfig.volar.setup{
	filetypes = {
		'typescript',
		'javascript',
		'javascriptreact',
		'typescriptreact',
		'vue',
		'json',
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
				defaultTagNameCase = 'both',
				defaultAttrNameCase = 'kebabCase',
				getDocumentNameCasesRequest = false,
				getDocumentSelectionRequest = false,
			},
		}
	}
}

lspconfig.jsonls.setup {
	capabilities = capabilities,
}

lspconfig.bashls.setup {
	capabilities = capabilities,
}

lspconfig.tsserver.setup {
	capabilities = capabilities,
}

lspconfig.ltex.setup {
	capabilities = capabilities,
}

lspconfig.neocmake.setup {
	capabilities = capabilities,
}

lspconfig.kotlin_language_server.setup {
	capabilities = capabilities,
}

