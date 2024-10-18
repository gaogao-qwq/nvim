--- Auto save
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = { "*" },
	callback = function()
		local excludes = { "sql", "mysql", "sbt" }
		for _, exclude in ipairs(excludes) do
			if vim.bo.ft == exclude then
				return
			end
		end
		vim.api.nvim_command("silent! wall")
	end,
	nested = true,
})

--- Load workspace specific files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		-- ftplugins
		local ftplugins = {
			filetypes = {},
			paths = vim.split(vim.fn.glob(vim.fn.getcwd() .. "/ftplugin/*.lua"), "\n", { trimempty = true }),
		}

		for _, path in pairs(ftplugins.paths) do
			table.insert(ftplugins.filetypes, tostring(vim.fs.basename(path)):sub(0, -5))
		end

		for i, _ in ipairs(ftplugins.paths) do
			-- print("filetype: " .. ftplugins.filetypes[i] .. " path: " .. ftplugins.paths[i] .. "\n")
			if ftplugins.filetypes[i] == vim.bo.ft then
				dofile(ftplugins.paths[i])
			end
		end

		-- workspace dotfile
		local dotfile_path = vim.fn.getcwd() .. ".nvim.lua"
		local dotfile = io.open(dotfile_path, "r")
		if dotfile ~= nil then
			dotfile:close()
			dofile(dotfile_path)
		end
	end,
})
