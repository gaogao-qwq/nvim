return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "K", false }
	end,
	keys = {
		-- stylua: ignore
		{"<leader>xf", function () vim.diagnostic.open_float() end, desc = "Open float diagnostics panel"},
	},
	opts = {
		autoformat = false,
		diagnostics = {
			underline = true,
			update_in_insert = true,
			virtual_text = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
					[vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
					[vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
					[vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
				},
			},
		},
		inlay_hints = {
			enabled = false,
		},
		codelens = {
			enabled = false,
		},
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						codeLens = {
							enable = true,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			clangd = {
				keys = {
					{ "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
				},
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern(
						"Makefile",
						"configure.ac",
						"configure.in",
						"config.h.in",
						"meson.build",
						"meson_options.txt",
						"build.ninja"
					)(fname) or require("lspconfig.util").root_pattern(
						"compile_commands.json",
						"compile_flags.txt"
					)(fname) or require("lspconfig.util").find_git_ancestor(fname)
				end,
				capabilities = {
					offsetEncoding = { "utf-16" },
				},
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style={BasedOnStyle: Google, UseTab: Always, IndentWidth: 4, TabWidth: 4}",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			},
			als = {
				root_dir = require("lspconfig.util").root_pattern("Makefile", ".git", "*.gpr", "*.adc"),
				cmd = { "ada_language_server" },
			},
		},
		setup = {
			clangd = function(_, opts)
				local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
				require("clangd_extensions").setup(
					vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts })
				)
				return false
			end,
		},
	},
}
