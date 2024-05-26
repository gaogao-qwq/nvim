return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	opts = {
		easing_function = "quadratic",
		performance_mode = false,
		hide_cursor = false,
	},
	-- stylua: ignore
	config = function()
		local neoscroll = require('neoscroll')
		local nc = require('neoscroll.config')
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
	end,
}
