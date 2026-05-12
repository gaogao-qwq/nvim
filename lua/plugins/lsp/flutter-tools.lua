return {
	"akinsho/flutter-tools.nvim",
	event = "VeryLazy",
	opts = {
		debugger = {
			enabled = true,
		},
		widget_guides = {
			enabled = true,
		},
		fvm = true,
		lsp = {
			capabilities = {
				semanticTokensProvider = nil,
			},
		},
	},
}
