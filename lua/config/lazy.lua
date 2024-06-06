local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "plugins" },
		{ import = "plugins.colorscheme" },
		{ import = "plugins.dap" },
		{ import = "plugins.editor" },
		{ import = "plugins.formatting" },
		{ import = "plugins.lsp" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.ui" },
		{ import = "plugins.util" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	checker = { enable = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"tutor",
			},
		},
	},
})
