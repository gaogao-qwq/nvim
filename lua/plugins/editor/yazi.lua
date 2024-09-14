return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	---@type YaziConfig
	opts = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		vim.list_extend(keys, {
			{ "<leader>fb", "<cmd>Yazi toggle<cr>", desc = "Toggle yazi session" },
		})
		return {
			open_for_directories = true,
			keymaps = {
				show_help = "<f1>",
			},
		}
	end,
}
