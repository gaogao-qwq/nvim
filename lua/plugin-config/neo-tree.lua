require("neo-tree").setup({
	close_if_last_window = false,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitingore = false,
			hide_hidden = false,
		}
	},
	source_selector = {
		winbar = true,
		statusline = true,
		show_scrolled_off_parent_node = false,
		sources = {
			{
				source = "filesystem",
				display_name = " 󰉓 Files "
			},
			{
				source = "buffers",
				display_name = " 󰈚 Buffers "
			},
			{
				source = "git_status",
				display_name = " 󰊢 Git "
			},
		},
		content_layout = "start",
		tabs_layout = "equal",
		truncation_character = "…",
		tabs_min_width = nil,
		tabs_max_width = nil,
		padding = 0,
		separator = { left = "▏", right= "▕" },
		separator_active = nil,
		show_separator_on_edge = false,
		highlight_tab = "NeoTreeTabInactive",
		highlight_tab_active = "NeoTreeTabActive",
		highlight_background = "NeoTreeTabInactive",
		highlight_separator = "NeoTreeTabSeparatorInactive",
		highlight_separator_active = "NeoTreeTabSeparatorActive",
	},
})
