return {
	"neovim/nvim-lspconfig",
	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "K", false }
	end,
	opts = {
		autoformat = false,
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "icons",
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
					[vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
					[vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
					[vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
				},
			},
		},
		inlay_hints = {
			enabled = false,
		},
		codelens = {
			enabled = false,
		},
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						codeLens = {
							enable = true,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		},
		setup = {},
	},
}
