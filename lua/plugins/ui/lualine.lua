local mode_map = {
	["n"] = "普通模式",
	["no"] = "等待操作",
	["nov"] = "等待操作",
	["noV"] = "等待操作",
	["no\22"] = "等待操作",
	["niI"] = "普通模式-插入",
	["niR"] = "普通模式-替换",
	["niV"] = "普通模式-虚拟替换",
	["nt"] = "终端-普通模式",
	["v"] = "视觉模式",
	["vs"] = "视觉模式-选择",
	["V"] = "行-视觉模式",
	["Vs"] = "行-视觉模式",
	["\22"] = "块-视觉模式",
	["\22s"] = "块-视觉模式",
	["s"] = "选择模式",
	["S"] = "行-选择模式",
	["\19"] = "块-选择模式",
	["i"] = "插入模式",
	["ic"] = "插入模式",
	["ix"] = "插入模式",
	["R"] = "替换模式",
	["Rc"] = "替换模式",
	["Rx"] = "替换模式",
	["Rv"] = "虚拟替换模式",
	["Rvc"] = "虚拟替换模式",
	["Rvx"] = "虚拟替换模式",
	["c"] = "命令行模式",
	["cr"] = "命令行模式",
	["cv"] = "ex模式",
	["ce"] = "ex模式",
	["r"] = "回车确认",
	["rm"] = "--更多--",
	["r?"] = "确认",
	["!"] = "shell模式",
	["t"] = "终端模式",
}

local client_lsp = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({bufnr = bufnr})

	if next(clients) == nil then
		return ""
	end

	local c = {}
	for _, client in ipairs(clients) do
		table.insert(c, client.name)
	end
	return " LSP: " .. table.concat(c, "|")
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		-- PERF: we don't need this lualine require madness 🤷
		local lualine_require = require("lualine_require")
		lualine_require.require = require

		local icons = LazyVim.config.icons

		vim.o.laststatus = vim.g.lualine_laststatus

		local opts = {
			options = {
				theme = "auto",
				globalstatus = vim.o.laststatus == 3,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(_)
							return mode_map[vim.api.nvim_get_mode().mode] or "__"
						end,
					},
				},
				lualine_b = { "branch" },

				lualine_c = {
					LazyVim.lualine.root_dir(),
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ LazyVim.lualine.pretty_path() },
				},
				lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = function() return LazyVim.ui.fg("Statement") end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return LazyVim.ui.fg("Constant") end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return LazyVim.ui.fg("Debug") end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return LazyVim.ui.fg("Special") end,
            },
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = { client_lsp },
				lualine_z = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
			},
			extensions = { "neo-tree", "lazy" },
		}

		-- do not add trouble symbols if aerial is enabled
		-- And allow it to be overriden for some buffer types (see autocmds)
		if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
			local trouble = require("trouble")
			local symbols = trouble.statusline({
				mode = "symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				hl_group = "lualine_c_normal",
			})
			table.insert(opts.sections.lualine_c, {
				symbols and symbols.get,
				cond = function()
					return vim.b.trouble_lualine ~= false and symbols.has()
				end,
			})
		end

		return opts
	end,
}
