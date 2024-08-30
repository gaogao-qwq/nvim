return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
	config = function()
		require("luasnip.loaders.from_lua").load({
			paths = {
				vim.fn.getcwd() .. "/snippets",
				tostring(vim.fn.stdpath("config")),
			},
		})
		require("luasnip.loaders.from_vscode").load({
			paths = {
				vim.fn.getcwd() .. "/snippets",
				tostring(vim.fn.stdpath("config")),
			},
		})
		require("luasnip.loaders.from_snipmate").load({
			paths = {
				vim.fn.getcwd() .. "/snippets",
				tostring(vim.fn.stdpath("config")),
			},
		})
	end,
}
