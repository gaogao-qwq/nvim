return {
	"folke/persistence.nvim",
	opts = {
		options = vim.opt.sessionoptions:get(),
		pre_save = function()
			vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
		end,
	},
}
