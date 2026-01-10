local opt = vim.opt

vim.g.c_syntax_for_h = true
vim.g.autoformat = false
vim.b.autoformat = false

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

---------------
--- Neovide ---
---------------
if vim.g.neovide then
	vim.o.guifont = "Maple Mono NF CN:h12"
	vim.g.neovide_transparency = 1.0
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_underline_stroke_scale = 1.0
	vim.g.neovide_theme = "auto"
	vim.g.neovide_refresh_rate = 165
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_cursor_trail_size = 0.8
	vim.g.neovide_cursor_vfx_mode = "sonicboom"
	vim.g.neovide_input_macos_option_key_is_meta = "only_left"
end
