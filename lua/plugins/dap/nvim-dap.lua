return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	config = function()
		local dap = require('dap')
		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = os.getenv('HOME') ..
			'/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = true,
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'cppdbg',
				request = 'launch',
				MIMode = 'gdb',
				miDebuggerServerAddress = 'localhost:1234',
				miDebuggerPath = '/usr/bin/gdb',
				cwd = '${workspaceFolder}',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
			},
		}
		dap.configurations.c = dap.configurations.cpp
	end
}
