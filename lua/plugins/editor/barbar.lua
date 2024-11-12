return {
	"romgrk/barbar.nvim",
	lazy = false,
	keys = {
		{ "<leader>b[d", "<cmd>BufferCloseBuffersLeft<cr>", desc = "Close all buffers at right" },
		{ "<leader>b]d", "<cmd>BufferCloseBuffersRight<cr>", desc = "Close all buffers at left" },
		{ "<leader>bp", "<cmd>BufferPick<cr>", desc = "Pick buffer" },
		{ "<leader>bP", "<cmd>BufferPin<cr>", desc = "Pin buffer" },
		{ "<M-h>", "<cmd>BufferMovePrevious<cr>", desc = "Move buffer to previous" },
		{ "<M-l>", "<cmd>BufferMoveNext<cr>", desc = "Move buffer to next" },
		{ "H", "<cmd>BufferPrevious<cr>", desc = "Move to previous buffer" },
		{ "L", "<cmd>BufferNext<cr>", desc = "Move to next buffer" },
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		icons = {
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true },
			},
			pinned = { button = "", filename = true },
		},
		sidebar_filetypes = {
			["neo-tree"] = true,
		},
		preset = "powerline",
	},
}
