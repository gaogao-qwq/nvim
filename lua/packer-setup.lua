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

	--- 前置 & 工具插件 ---
	use 'kevinhwang91/promise-async'
	use 'nvim-lua/plenary.nvim'
	use '3rd/image.nvim'
	use 'MunifTanjim/nui.nvim'

	--- 外观 ---
	-- 主题
	use 'folke/tokyonight.nvim'
	-- 状态栏
	use 'nvim-lualine/lualine.nvim'
	-- 文档树
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
	}
	-- 快速切换窗口
	use 'christoomey/vim-tmux-navigator'
	-- 语法高亮
	use 'nvim-treesitter/nvim-treesitter'
	-- 缩进提示
	use 'lukas-reineke/indent-blankline.nvim'
	-- 彩虹分隔符
	use 'HiPhish/rainbow-delimiters.nvim'
	-- Nerd Fonts 图标补丁
	use 'mortepau/codicons.nvim'
	-- devicons
	use 'nvim-tree/nvim-web-devicons'
	-- 自动保存
	use 'Pocco81/auto-save.nvim'
	-- 启动页面
	use 'startup-nvim/startup.nvim'

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
	use 'folke/neodev.nvim'
	-- 显示引用，定义，实现
	use 'Wansmer/symbol-usage.nvim'
	use 'folke/trouble.nvim'
	-- Java lsp
	use 'mfussenegger/nvim-jdtls'

	--- 调试器 ---
	-- dap
	use 'mfussenegger/nvim-dap'
	-- mason 支持
	use 'jay-babu/mason-nvim-dap.nvim'
	-- 变量值显示
	use 'theHamsta/nvim-dap-virtual-text'
	-- dap ui 显示
	use 'rcarriga/nvim-dap-ui'
	-- adp telescope 集成
	use 'nvim-telescope/telescope-dap.nvim'

	--- 实用工具 ---
	-- GitHub Copilot
	use 'github/copilot.vim'
	-- WakaTime
	use 'wakatime/vim-wakatime'
	-- gcc gc 注释
	use 'numToStr/Comment.nvim'
	-- 自动补全括号
	use 'windwp/nvim-autopairs'
	-- 缓冲区
	use 'akinsho/bufferline.nvim'
	-- 左侧 git 提示
	use 'lewis6991/gitsigns.nvim'
	-- 文件检索
	use 'nvim-telescope/telescope.nvim'
	-- 前端颜色显示
	use 'norcalli/nvim-colorizer.lua'
	-- 内嵌终端优化
	-- use 'skywind3000/vim-terminal-help' 不好用
	use 'voldikss/vim-floaterm'
	-- vim-go
	use 'fatih/vim-go'
	-- 画图器
	use 'jbyuki/venn.nvim'
	-- 代码块折叠生成器
	use 'kevinhwang91/nvim-ufo'
	-- 列显示状态
	use 'luukvbaal/statuscol.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
