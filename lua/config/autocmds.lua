vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = { "*" },
	callback = function ()
		if vim.bo.filetype == 'sql' or vim.bo.filetype == 'mysql' then
			return
		end
		vim.api.nvim_command("silent! wall")
	end,
	nested = true,
})
