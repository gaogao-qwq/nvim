return {
	'nvimdev/lspsaga.nvim',
	opts = {
		lightbulb = {
			enable = false
		},
	},
	config = function(_, opts)
		require('lspsaga').setup(opts)
	end,
}
