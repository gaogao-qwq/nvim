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
