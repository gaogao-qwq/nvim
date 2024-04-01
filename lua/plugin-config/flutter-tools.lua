require('flutter-tools').setup {
	widget_guides = {
		enabled = true,
	},
	lsp = {
		color = {
			enabled = true,
			background = false,
			foreground = false,
			virtual_text = true,
			virtual_text_str = "■",
		}
	},
	fvm = true
}
