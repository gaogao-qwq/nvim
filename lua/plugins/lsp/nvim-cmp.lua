return {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-calc",
		"onsails/lspkind.nvim",
	},
	opts = function(_, opts)
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		opts.mapping = vim.tbl_extend("force", opts.mapping, {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
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
		})
		opts.preselect = cmp.PreselectMode.None
		opts.completion = {
			completeopt = "noselect",
		}
		opts.window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		}
		opts.formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[Latex]",
				})
			})
		}
		opts.snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		}
		opts.sources = {
			{ name = "calc" },
			{ name = "orgmode" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "calc" },
		}
	end,
}
