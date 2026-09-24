local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.foldcolumn = "1"
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true
opt.wrap = true
opt.cursorline = true
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"

vim.g.c_syntax_for_h = true
vim.g.autoformat = false
vim.b.autoformat = false

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
