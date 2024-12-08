return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = function()
		vim.g.autoformat = false
		local opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
				lsp_format = "fallback", -- not recommended to change
			},
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				go = { "goimports", "gofmt" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				objc = { "clang_format" },
				markdown = { "markdownlint" },
				haskell = { "stylish-haskell" }
			},
			formatters = {
				injected = { options = { ignore_errors = true } },
			},
			dartls = {
				preend_args = { "--enable-experiment=tall-style" },
			},
		}
		return opts
	end,
}
