local opt = vim.opt

-- 移动 screen 时确保光标上下空间不得低于10行
opt.scrolloff = 10

-- 行号
opt.relativenumber = true
opt.number = true

-- 代码块折叠方式
opt.foldcolumn = "1"
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldlevel = 99
opt.foldlevelstart = 99
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

-- 诊断标志
local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

---------------
--- Neovide ---
---------------
vim.o.guifont = "FiraCode Nerd Font Mono:h12"
vim.g.neovide_transparency = 0.9
vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_underline_stroke_scale = 1.0
vim.g.neovide_theme = "auto"
vim.g.neovide_refresh_rate = 165
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_confirm_quit = true
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_vfx_mode = "sonicboom"
