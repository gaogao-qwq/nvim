local a = 0

vim.g.mapleader = " "

local keymap = vim.keymap

----------------
--- 插入模式 ---
----------------

keymap.set("i", "jk", "<ESC>") -- esc 改为 jk

-- keymap.set("i", "~", "copilot#Accept('<CR>')", { silent = true, script = true, expr = true }) -- 接受 copilot 提示 

----------------
--- 视觉模式 ---
----------------

-- 单行或多行移动
keymap.set("v", "<leader>J", ":m '>+1<CR>gv=gv") -- 主键 + shift + j 向下移动
keymap.set("v", "<leader>K", ":m '<-2<CR>gv=gv") -- 主键 + shift + k 向上移动

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
local t = {}
t['K'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['J'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
t['zt']    = {'zt', {'250'}}
t['zz']    = {'zz', {'250'}}
t['zb']    = {'zb', {'250'}}
require('neoscroll.config').set_mappings(t)

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- 进入视觉模式并全选
keymap.set("n", "<C-a>", "ggVG")

-- 代码块折叠展开
keymap.set('n', 'zR', require('ufo').openAllFolds)
keymap.set('n', 'zM', require('ufo').closeAllFolds)

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
keymap.set('n', '<leader>ff', telescope.find_files, {})		-- 主键 + ff 查找文件
keymap.set('n', '<leader>fo', telescope.oldfiles, {})		-- 主键 + fo 查找旧文件
keymap.set('n', '<leader>fg', telescope.live_grep, {})		-- 主键 + fg 查找单词
keymap.set('n', '<leader>fb', telescope.buffers, {})		-- 主键 + fb 查找标签
keymap.set('n', '<leader>fh', telescope.help_tags, {})		-- 主键 + fh 查找帮助
keymap.set(													-- 主键 + fb 从当前 buffer 的路径浏览文件
	'n',
	'<leader>fb',
	"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{}
)

-- trouble
keymap.set("n", "tr", function() require("trouble").toggle("lsp_references") end)					-- tr 查看光标悬停处引用
keymap.set("n", "td", function() require("trouble").toggle("lsp_definitions") end)					-- td 查看光标悬停处定义
keymap.set("n", "ti", function() require("trouble").toggle("lsp_implementations") end)

-- lspsaga
keymap.set("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>")			-- 在光标处显示 lspsaga hover
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")		-- 在光标处显示快速代码操作悬浮窗
keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>")				-- 在光标处批量重命名

-- 内嵌终端
-- 主键 + ] 打开或关闭内嵌终端
keymap.set("n", "<leader>]", "<cmd>Lspsaga term_toggle<CR>")
keymap.set("t", "<leader>]", "<cmd>Lspsaga term_toggle<CR>")

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
