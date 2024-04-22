return {
	"karb94/neoscroll.nvim",
	opts = {
		performance_mode = true,
	},
	config = function()
		require("neoscroll").setup()
	end,
}
