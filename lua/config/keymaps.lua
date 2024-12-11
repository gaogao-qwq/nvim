vim.g.mapleader = " "

local keymap = vim.keymap

----------------
--- 插入模式 ---
----------------

keymap.set("i", "jk", "<ESC>") -- esc 改为 jk

-- Emacs 风格光标移动
keymap.set("i", "<C-p>", "<Up>")
keymap.set("i", "<C-f>", "<Right>")
keymap.set("i", "<C-n>", "<Down>")
keymap.set("i", "<C-b>", "<Left>")
keymap.set("i", "<M-b>", "<C-Left>")
keymap.set("i", "<M-f>", "<C-Right>")
keymap.set("i", "<C-a>", "<Home>")
keymap.set("i", "<C-e>", "<End>")

----------------
--- 正常模式 ---
----------------

keymap.set("n", "<M-H>", [[<cmd>vertical resize -2<cr>]], { silent = true, nowait = true })
keymap.set("n", "<M-J>", [[<cmd>horizontal resize +2<cr>]], { silent = true, nowait = true })
keymap.set("n", "<M-K>", [[<cmd>horizontal resize -2<cr>]], { silent = true, nowait = true })
keymap.set("n", "<M-L>", [[<cmd>vertical resize +2<cr>]], { silent = true, nowait = true })

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- telescope
-- local telescope = require('telescope.builtin')
-- keymap.set("n", "<leader>ff", telescope.find_files, {}) -- 主键 + ff 查找文件
-- keymap.set("n", "<leader>fo", telescope.oldfiles, {})   -- 主键 + fo 查找旧文件
-- keymap.set("n", "<leader>fg", telescope.live_grep, {})  -- 主键 + fg 查找单词
-- keymap.set("n", "<leader>fb", telescope.buffers, {})    -- 主键 + fb 查找标签
-- keymap.set("n", "<leader>fh", telescope.help_tags, {})  -- 主键 + fh 查找帮助
-- keymap.set("n", "<leader>ft", '<cmd>TodoTelescope<CR>') -- 主键 + ft 查找 TODO
