return {
	"danymat/neogen",
	opts = {
		snippet_engine = "luasnip",
	},
	keys = {
		{
			"<leader>ngf",
			-- stylua: ignore
			function() require("neogen").generate({ type = "func" }) end,
			desc = "generate function annotation",
		},
		{
			"<leader>ngc",
			-- stylua: ignore
			function() require("neogen").generate({ type = "class" }) end,
			desc = "generate class annotation",
		},
		{
			"<leader>ngt",
			-- stylua: ignore
			function() require("neogen").generate({ type = "type" }) end,
			desc = "generate type annotation",
		},
		{
			"<leader>ngF",
			-- stylua: ignore
			function() require("neogen").generate({ type = "file" }) end,
			desc = "generate file annotation",
		},
	},
}
