return {
	'nvimdev/lspsaga.nvim',
	event = "VeryLazy",
	opts = {
		lightbulb = {
			enable = false
		},
	},
	config = function(_, opts)
		require('lspsaga').setup(opts)
	end,
}
