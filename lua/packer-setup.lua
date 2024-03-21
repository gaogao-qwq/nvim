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
	use 'stevearc/dressing.nvim'

	--- 外观 ---
	-- 主题
	use 'folke/tokyonight.nvim'
	-- TODO 高亮
	use 'folke/todo-comments.nvim'
	-- 状态栏
	use 'nvim-lualine/lualine.nvim'
	-- 文档树
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
	}
	-- 快速切换窗口
	use 'christoomey/vim-tmux-navigator'
	-- 引用高亮
	use 'RRethy/vim-illuminate'
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
	-- 平滑滚动
	use 'karb94/neoscroll.nvim'
	-- nvim 信息弹窗
	use 'rcarriga/nvim-notify'
	-- 更好的 cmdline
	use 'folke/noice.nvim'

	--- LSP ---
	-- lspconfig
	use 'neovim/nvim-lspconfig'
	-- LSP 安装器
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	-- LSP 插件
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'onsails/lspkind.nvim'
	use 'hrsh7th/cmp-calc'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use 'hrsh7th/cmp-path'
	use 'folke/neodev.nvim'
	-- LSP 体验优化
	use 'nvimdev/lspsaga.nvim'
	-- 引用，定义，实现跳转
	use 'folke/trouble.nvim'
	-- 显示引用，定义，实现
	use 'Wansmer/symbol-usage.nvim'
	-- Java lsp
	use 'mfussenegger/nvim-jdtls'
	-- rust tools fork
	use 'mrcjkb/rustaceanvim'
	-- Justfile 语法高亮
	use 'IndianBoy42/tree-sitter-just'
	-- Flutter lsp 工具
	use 'akinsho/flutter-tools.nvim'

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
	-- WakaTime
	use 'wakatime/vim-wakatime'
	-- Discord rich presence
	use 'andweeb/presence.nvim'
	-- gcc gc 注释
	use 'numToStr/Comment.nvim'
	-- 自动补全括号
	use 'windwp/nvim-autopairs'
	-- 缓冲区
	use 'akinsho/bufferline.nvim'
	-- 左侧 git 提示
	use 'lewis6991/gitsigns.nvim'
	-- telescope 文件检索
	use 'nvim-telescope/telescope.nvim'
	-- telescope 文件浏览器集成
	use 'nvim-telescope/telescope-file-browser.nvim'
	-- telescope fzf 集成
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	-- telescope 单词检索
	use 'nvim-telescope/telescope-live-grep-args.nvim'
	-- 前端颜色显示
	use 'norcalli/nvim-colorizer.lua'
	-- vim-go
	use 'fatih/vim-go'
	-- 画图器
	use 'jbyuki/venn.nvim'
	-- 代码块折叠生成器
	use 'kevinhwang91/nvim-ufo'
	-- 列显示状态
	use 'luukvbaal/statuscol.nvim'
	-- 工作区配置
	use 'folke/neoconf.nvim'
	-- orgmode 支持
	use 'nvim-orgmode/orgmode'
	-- 文档抬头显示
	use 'lukas-reineke/headlines.nvim'
	-- markdown 预览
	use({
    	"iamcco/markdown-preview.nvim",
    	run = function() vim.fn["mkdp#util#install"]() end,
	})
	-- 大文件自动关闭部分特性
	use 'LunarVim/bigfile.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
