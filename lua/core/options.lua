local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 代码块折叠方式
opt.foldmethod = "manual"
opt.foldnestmax = 20
opt.foldenable = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[highlight Normal guibg=NONE ctermbg=None]]
-- vim.cmd[[highlight NormalNC guibg=NONE ctermbg=None]]
-- vim.cmd[[highlight NormalSB guibg=NONE ctermbg=None]]
-- vim.cmd[[highlight NvimTreeNormal guibg=NONE ctermbg=None]]
-- vim.cmd[[highlight NvimTreeNormalNC guibg=NONE ctermbg=None]]
-- vim.cmd[[highlight TelescopeNormal guibg=NONE ctermbg=None]]
-- vim.cmd[[highlight SignColumn guibg=NONE ctermbg=None]]

-- 诊断标志
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 禁用 Copilot Tab 选取补全
vim.g.copilot_no_tab_map = true
