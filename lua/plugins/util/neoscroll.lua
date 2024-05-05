return {
	"karb94/neoscroll.nvim",
	opts = {
		easing_function = "quadratic",
		performance_mode = true,
		hide_cursor = false,
	},
	config = function()
		require("neoscroll").setup()
		require("neoscroll.config").set_mappings({
			["K"] = { "scroll", { "-vim.wo.scroll", "true", "250" } },
			["J"] = { "scroll", { "vim.wo.scroll", "true", "250" } },
			["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } },
			["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } },
			["<C-y>"] = { "scroll", { "-0.10", "false", "100" } },
			["<C-e>"] = { "scroll", { "0.10", "false", "100" } },
			["zt"] = { "zt", { "250" } },
			["zz"] = { "zz", { "250" } },
			["zb"] = { "zb", { "250" } },
		})
	end,
}
