vim.g.mapleader = " "

local keymap = vim.keymap

--- 插入模式 ---
keymap.set("i", "jk", "<ESC>") -- esc 改为 jk

--- 视觉模式 ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- ctrl + j 向上移动
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- ctrl + k 向下移动

--- 正常模式 ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 主键 + sv 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 主键 + sh 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

--- 插件 ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- 切换 buffer
keymap.set("n", "<M-e>", ":bnext<CR>")
keymap.set("n", "<M-q>", ":bprevious<CR>")
