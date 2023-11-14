local a = 0

vim.g.mapleader = " "

local keymap = vim.keymap

--- 插入模式 ---
keymap.set("i", "jk", "<ESC>") -- esc 改为 jk

keymap.set("i", "~", "copilot#Accept('<CR>')", { silent = true, script = true, expr = true }) -- 接受 copilot 提示 

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
-- 主键 + = 打开或关闭内嵌终端
keymap.set("n", "<leader>]", ":FloatermToggle<CR>")
keymap.set("t", "<leader>]", "<c-\\><c-N>:FloatermToggle<CR>")
keymap.set("t", "<leader>[", "<c-\\><c-N>:FloatermKill<CR>")

-- 移动
keymap.set("n", "J", ":+10<CR>")
keymap.set("n", "K", ":-10<CR>")

-- 在光标处显示 lsp hover
keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end)

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 进入视觉模式并全选
keymap.set("n", "<C-a>", "ggVG")

-- 代码块折叠展开
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- 打开文件资源管理器
keymap.set("n", "<leader>e", ":Neotree<CR>")

-- 切换 buffer
keymap.set("n", "<leader><tab>", ":bnext<CR>")
keymap.set("n", "<leader>q", ":bprevious<CR>")

-- telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})	-- 主键 + ff 查找文件
keymap.set('n', '<leader>fo', builtin.oldfiles, {})		-- 主键 + fo 查找旧文件
-- keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})		-- 主键 + fb 查找标签
keymap.set('n', '<leader>fh', builtin.help_tags, {})	-- 主键 + fh 查找帮助

keymap.set("n", "<leader>tt", function() require("trouble").toggle() end)							-- 主键 + tt 显示所有问题
keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)	-- 主键 + tw 显示工作区内问题
keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)		-- 主键 + td 显示当前文档内问题
keymap.set("n", "<leader>tf", function() require("trouble").toggle("quickfix") end)					-- 主键 + tf 快速修复
keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)					-- 主键 + tl 窗口级别快速修复
keymap.set("n", "tr", function() require("trouble").toggle("lsp_references") end)					-- tr 查看光标悬停处引用
keymap.set("n", "td", function() require("trouble").toggle("lsp_definitions") end)					-- td 查看光标悬停处定义

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
-- keymap.set("n", "K", "<cmd>lua require'dapui'.eval()<cr>")
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>")
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>")
