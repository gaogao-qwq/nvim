return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {},
	keys = {
		-- stylua: ignore
		{ "<leader>uN", function() Snacks.notifier.show_history() end, desc = "Show notification history" },
	},
}
