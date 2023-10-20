local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost packer-setup.lua source <afile> | PackerSync
	augroup end
]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	--- 外观 ---
	-- 主题
	use 'folke/tokyonight.nvim'
	-- 状态栏
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- 文档树
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	-- 快速切换窗口
	use 'christoomey/vim-tmux-navigator'
	-- 语法高亮
	use 'nvim-treesitter/nvim-treesitter'
	-- 彩虹括号
	use 'p00f/nvim-ts-rainbow'
	-- 缩进提示
	use 'lukas-reineke/indent-blankline.nvim'
	-- 彩虹下划线
	use 'HiPhish/rainbow-delimiters.nvim'
	-- Nerd Fonts 图标补丁
	use 'mortepau/codicons.nvim'
	-- 自动保存
	use 'Pocco81/auto-save.nvim'
	-- 启动页面
	use {
		'startup-nvim/startup.nvim',
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	}

	--- LSP ---
	-- lspconfig
	use 'neovim/nvim-lspconfig'
	-- LSP 安装器
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	-- LSP 插件
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use 'hrsh7th/cmp-path'
	use "folke/neodev.nvim"

	--- 调试器 ---
	-- dap
	use 'mfussenegger/nvim-dap'
	-- mason 支持
	use 'jay-babu/mason-nvim-dap.nvim'
	-- 变量值显示
	use 'theHamsta/nvim-dap-virtual-text'
	-- dap ui 显示
	use 'rcarriga/nvim-dap-ui'
	-- telescope 集成
	use 'nvim-telescope/telescope-dap.nvim'

	-- gcc gc 注释
	use 'numToStr/Comment.nvim'
	-- 自动补全括号
	use 'windwp/nvim-autopairs'
	-- 缓冲区
	use 'akinsho/bufferline.nvim'
	-- 左侧 git 提示
	use 'lewis6991/gitsigns.nvim'
	-- 文件检索
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- 内嵌终端优化
	-- use 'skywind3000/vim-terminal-help' 不好用
	use 'voldikss/vim-floaterm'

	-- vim-go
	use 'fatih/vim-go'

	-- 画图器
	use "jbyuki/venn.nvim"

	if packer_bootstrap then
		require('packer').sync()
	end
end)
