local config = {
	keep_indentation = false,
	fill_char = '━',
	sections = {
		left = {
			'━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
		},
		right = {
			'┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
		}
	}
}

require('pretty-fold').setup({
    global = config, -- global config table for all foldmethods
    marker = { process_comment_signs = 'spaces' },
    expr   = { process_comment_signs = false },
})
