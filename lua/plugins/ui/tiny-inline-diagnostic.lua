return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		-- Disable diagnostic virtual_text by default
		vim.diagnostic.config({ virtual_text = false })
		require("tiny-inline-diagnostic").setup()
	end,
}
