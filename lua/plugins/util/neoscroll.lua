return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	-- stylua: ignore
	config = function()
		if vim.g.neovide then
			vim.keymap.set({"n", "v", "x"}, "K", "<C-u>", { silent = true })
			vim.keymap.set({"n", "v", "x"}, "J", "<C-d>", { silent = true })
			return
		end
		local neoscroll = require('neoscroll')
		local keymap = {
			["K"]     = function() neoscroll.ctrl_u({ duration = 250 }) end;
			["J"]     = function() neoscroll.ctrl_d({ duration = 250 }) end;
			["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false; duration = 100 }) end;
			["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false; duration = 100 }) end;
		}
		local modes = { 'n', 'v', 'x' }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
		local opts = {
			hide_cursor = false,
		}
		neoscroll.setup(opts)
	end,
}
