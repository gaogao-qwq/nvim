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

keymap.set({ "n", "v" }, "J", "<C-d>", { noremap = true })
keymap.set({ "n", "v" }, "K", "<C-u>", { noremap = true })

keymap.set("n", "<M-H>", [[<cmd>vertical resize -2<cr>]], { silent = true, nowait = true })
keymap.set("n", "<M-J>", [[<cmd>horizontal resize +2<cr>]], { silent = true, nowait = true })
keymap.set("n", "<M-K>", [[<cmd>horizontal resize -2<cr>]], { silent = true, nowait = true })
keymap.set("n", "<M-L>", [[<cmd>vertical resize +2<cr>]], { silent = true, nowait = true })

keymap.del("n", "gra")
keymap.del("n", "gri")
keymap.del("n", "grn")
keymap.del("n", "grr")
keymap.del("n", "grt")

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")
