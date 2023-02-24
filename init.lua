--- packer ---
require('packer-setup')

--- neovim 配置 ---
require('core.options')
require('core.keymaps')

--- 插件配置 ---
require('plugin-config.lsp-config')
require('plugin-config.lualine')
require('plugin-config.nvim-tree')
require('plugin-config.nvim-treesitter')
require('plugin-config.nvim-cmp')
require('plugin-config.comment')
require('plugin-config.nvim-autopairs')
require('plugin-config.bufferline')
require('plugin-config.gitsigns')
require('plugin-config.telescope')
require('plugin-config.vim-floaterm')
require('plugin-config.indent-blankline')
require('plugin-config.dap.dap-config').setup()
require('plugin-config.dap.telescope-dap')
require('plugin-config.dap.dap-virtual-text')
require('plugin-config.dap.dap-ui')
require('plugin-config.neodev')
