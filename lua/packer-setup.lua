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
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
