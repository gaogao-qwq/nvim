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
			color = {
				enabled = true,
				background = false,
				background_color = { r = 19, g = 17, b = 24 },
				foreground = false,
				virtual_text = true,
				virtual_text_str = "■",
			},
		},
	},
}
