return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = { enabled = false },
		indent = { enabled = false },
		scroll = {
			animate = {
				duration = { step = 15, total = 250 },
				easing = "linear",
				fps = 120,
			},
			spamming = 10,
			filter = function(buf)
				return vim.g.snacks_scroll ~= false
					and vim.b[buf].snacks_scroll ~= false
					and vim.bo[buf].buftype ~= "terminal"
			end,
		},
	},
	keys = {
		-- stylua: ignore
		{ "<leader>uN", function() Snacks.notifier.show_history() end, desc = "Show notification history" },
		{ "<leader>n", false },
	},
}
