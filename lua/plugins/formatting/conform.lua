return {
	"stevearc/conform.nvim",
	opts = function()
		vim.g.autoformat = false
		local opts = {
			-- LazyVim will use these options when formatting with the conform.nvim formatter
			format = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
				lsp_fallback = true, -- not recommended to change
			},
			---@type table<string, conform.FormatterUnit[]>
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				go = { "goimports", "gofmt" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				markdown = { "markdownlint" },
			},
			-- The options you set here will be merged with the builtin formatters.
			-- You can also define any custom formatters here.
			---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
			formatters = {
				injected = { options = { ignore_errors = true } },
				clang_format = { prepend_args = { "-style={BasedOnStyle: Google, UseTab: Always, IndentWidth: 4, TabWidth: 4}" } },
			},
		}
		return opts
	end,
}
