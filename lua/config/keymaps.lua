vim.g.mapleader = " "

local keymap = vim.keymap

----------------
--- 插入模式 ---
----------------

keymap.set("i", "jk", "<ESC>") -- esc 改为 jk

----------------
--- 正常模式 ---
----------------

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- 打开文件资源管理器
keymap.set("n", "<leader>e", "<cmd>Neotree<CR>")

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

keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end)

-- 内嵌终端
-- 主键 + ] 打开或关闭内嵌终端
keymap.set("n", "<leader>]", "<cmd>ToggleTerm<CR>")
keymap.set("t", "<leader>]", "<cmd>ToggleTerm<CR>")
