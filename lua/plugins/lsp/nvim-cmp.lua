return {
	"iguanacucumber/magazine.nvim",
	name = "nvim-cmp",
	event = "VeryLazy",
	opts = function()
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()

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
				format = function(entry, item)
					local icons = LazyVim.config.icons.kinds
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end

					local widths = {
						abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
						menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
					}

					for key, width in pairs(widths) do
						if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
							item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
						end
					end

					return item
				end,
			},
			snippet = {
				expand = function(item)
					return LazyVim.cmp.expand(item.body)
				end,
			},
			sources = {
				{ name = "luasnip" },
				{ name = "orgmode" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
			sorting = defaults.sorting,
		}
	end,
}
