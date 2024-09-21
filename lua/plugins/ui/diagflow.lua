return {
	"dgagn/diagflow.nvim",
	event = "LspAttach",
	opts = {
		enable = function()
			return vim.bo.filetype ~= "lazy"
		end,
		scope = "line",
		update_event = { "DiagnosticChanged" },
	},
}
