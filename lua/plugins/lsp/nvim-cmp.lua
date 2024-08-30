return {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-calc",
		"onsails/lspkind.nvim",
	},
	opts = function()
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local lspkind = require("lspkind")

		return {
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-n>"] = cmp.config.disable,
				["<C-p>"] = cmp.config.disable,
			}),
			preselect = cmp.PreselectMode.None,
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 100,
					ellipsis_char = "...",
					show_labelDetails = true,
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[Latex]",
						emoji = "[Emoji]",
					},
				}),
			},
			snippet = {
				expand = function(item)
					return LazyVim.cmp.expand(item.body)
				end,
			},
			sources = {
				{ name = "luasnip" },
				{ name = "calc" },
				{ name = "orgmode" },
				{ name = "emoji" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
			sorting = defaults.sorting,
		}
	end,
}
