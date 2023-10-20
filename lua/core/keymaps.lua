vim.g.mapleader = " "

local keymap = vim.keymap

--- 插入模式 ---
keymap.set("i", "jk", "<ESC>") -- esc 改为 jk

--- 视觉模式 ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- shift + j 向下移动
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- shift + k 向上移动

-- 全选
keymap.set("v", "<C-a>", "<ESC>ggVG")

--- 正常模式 ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 主键 + sv 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 主键 + sh 垂直新增窗口

-- 内嵌终端
-- ALT + = 打开或关闭内嵌终端
keymap.set("n", "<M-=>", ":FloatermToggle<CR>")
keymap.set("t", "<M-=>", "<c-\\><c-N>:FloatermToggle<CR>")
keymap.set("t", "<M-=>", "<c-\\><c-N>:FloatermKill<CR>")

-- 移动
keymap.set("n", "<M-j>", ":+10<CR>")
keymap.set("n", "<M-k>", ":-10<CR>")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 进入视觉模式并全选
keymap.set("n", "<C-a>", "ggVG")

--- 插件 ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- 切换 buffer
keymap.set("n", "<M-e>", ":bnext<CR>")
keymap.set("n", "<M-q>", ":bprevious<CR>")

-- telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})	-- 主键 + ff 查找文件
keymap.set('n', '<leader>fo', builtin.oldfiles, {})		-- 主键 + fo 查找旧文件
-- keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})		-- 主键 + fb 查找标签
keymap.set('n', '<leader>fh', builtin.help_tags, {})	-- 主键 + fh 查找帮助

-- debug
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint(); require'plugin-config.dap.dap-util'.store_breakpoints(true)<cr>")
keymap.set("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>")
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>")
keymap.set("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set('n', '<F10>', '<cmd>lua require"plugin-config.dap.dap-util".reload_continue()<CR>')
keymap.set("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>")
keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", "K", "<cmd>lua require'dapui'.eval()<cr>")
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>")
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>")
