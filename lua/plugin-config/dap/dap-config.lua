local M = {}

local function mason_config()
	local mason_nvim_dap = require "mason-nvim-dap"
	mason_nvim_dap.setup {
		ensure_installed = { "python", "delve", "cpptools"},
		automatic_installation = false,
		automatic_setup = true,
	}
	mason_nvim_dap.setup_handlers {}
end

local function config_sign()
	local dap_breakpoint = {
		error = {
			text = "",
			texthl = "LspDiagnosticSignError",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "",
			texthl = "LspDiagnosticSignError",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "*",
			texthl = "LspDiagnosticSignError",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticSignError",
		},
	}
	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function config_dapui()
  local dap, dapui = require "dap", require "dapui"

  local debug_open = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
    vim.api.nvim_command("NvimTreeClose")
  end
  local debug_close = function()
    dap.repl.close()
    dapui.close()
    vim.api.nvim_command("DapVirtualTextDisable")
    -- vim.api.nvim_command("bdelete! term:")   -- close debug temrinal
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    debug_open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    debug_close()
  end
  dap.listeners.before.event_exited["dapui_config"]     = function()
    debug_close()
  end
  dap.listeners.before.disconnect["dapui_config"]       = function()
    debug_close()
  end
end

local function config_debuggers()
	local dap = require "dap"
	require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'cpp' } })
	require('plugin-config.dap.dap-cpp')
end

function M.setup()
	mason_config()
	config_sign()
	config_dapui()
	config_debuggers()
end

return M
