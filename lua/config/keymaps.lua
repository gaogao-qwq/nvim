local a = 0

vim.g.mapleader = " "

local keymap = vim.keymap

----------------
--- 插入模式 ---
----------------

keymap.set("i", "jk", "<ESC>") -- esc 改为 jk

----------------
--- 视觉模式 ---
----------------

-- 单行或多行移动
keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv") -- Meta + j 向下移动
keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv") -- Meta + k 向上移动

-- 全选
keymap.set("v", "<C-a>", "<ESC>ggVG")

----------------
--- 正常模式 ---
----------------

-- 切换自动换行模式
keymap.set("n", "<leader>nw", "<cmd>set nowrap<CR>")
keymap.set("n", "<leader>wr", "<cmd>set wrap<CR>")

-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 主键 + sv 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 主键 + sh 垂直新增窗口

-- 平滑移动
local t    = {}
t['K']     = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }
t['J']     = { 'scroll', { 'vim.wo.scroll', 'true', '250' } }
t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
t['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
t['zt']    = { 'zt', { '250' } }
t['zz']    = { 'zz', { '250' } }
t['zb']    = { 'zb', { '250' } }
require('neoscroll.config').set_mappings(t)

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- 进入视觉模式并全选
keymap.set("n", "<C-a>", "ggVG")

-- 切换 inlay_hint 启用状态
keymap.set('n', '<leader>li', function()
	vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
end)

-- 切换 nvim-cmp 补全启用状态
keymap.set("n", "<leader>lc", function() vim.g.cmp_enabled = not vim.g.cmp_enabled end)

-- 打开文件资源管理器
keymap.set("n", "<leader>e", "<cmd>Neotree<CR>")

-- 切换 buffer
keymap.set("n", "<leader><tab>", "<cmd>bnext<CR>")
keymap.set("n", "<leader>q", "<cmd>bprevious<CR>")

-- 关闭 buffer
keymap.set("n", "[c", "<cmd>BufferLineCloseLeft<CR>")
keymap.set("n", "]c", "<cmd>BufferLineCloseRight<CR>")

-- telescope
local telescope = require('telescope.builtin')
keymap.set('n', '<leader>ff', telescope.find_files, {}) -- 主键 + ff 查找文件
keymap.set('n', '<leader>fo', telescope.oldfiles, {})   -- 主键 + fo 查找旧文件
keymap.set('n', '<leader>fg', telescope.live_grep, {})  -- 主键 + fg 查找单词
keymap.set('n', '<leader>fb', telescope.buffers, {})    -- 主键 + fb 查找标签
keymap.set('n', '<leader>fh', telescope.help_tags, {})  -- 主键 + fh 查找帮助
keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>') -- 主键 + ft 查找 TODO
keymap.set(                                             -- 主键 + fb 从当前 buffer 的路径浏览文件
	'n',
	'<leader>fb',
	"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{}
)

-- trouble
keymap.set("n", "tr", function() require("trouble").toggle("lsp_references") end)      -- tr 查看光标悬停处引用
keymap.set("n", "td", function() require("trouble").toggle("lsp_definitions") end)     -- td 查看光标悬停处定义
keymap.set("n", "ti", function() require("trouble").toggle("lsp_implementations") end) -- ti 查看光标悬停处实现
keymap.set("n", "tt", "<cmd>TodoTrouble<CR>")                                          -- tt 查看光标悬停处 TODO

-- lspsaga
keymap.set("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>")    -- 在光标处显示 lspsaga hover

-- 内嵌终端
-- 主键 + ] 打开或关闭内嵌终端
keymap.set("n", "<leader>]", "<cmd>Toggleterm<CR>")
keymap.set("t", "<leader>]", "<cmd>Toggleterm<CR>")
