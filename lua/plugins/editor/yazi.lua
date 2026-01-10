return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>fb", "<cmd>Yazi toggle<cr>" },
	},
	opts = function()
		return {
			open_for_directories = true,
			keymaps = {
				show_help = "<f1>",
			},
		}
	end,
}
