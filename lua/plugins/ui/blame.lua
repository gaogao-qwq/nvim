return {
	"FabijanZulj/blame.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>gi", "<cmd>BlameToggle virtual<cr>", desc = "Toggle git blame virtual text" },
		{ "<leader>gI", "<cmd>BlameToggle window<cr>", desc = "Toggle git blame window text" },
	},
	config = function()
		require("blame").setup()
	end,
}
