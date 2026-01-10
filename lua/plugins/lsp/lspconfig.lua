return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	keys = {
		-- stylua: ignore
		{"<leader>h", function() vim.lsp.buf.hover() end, desc = "Open lsp hover"},
		{
			"<leader>xf",
			-- stylua: ignore
			function() vim.diagnostic.open_float({ border = "rounded" }) end,
			desc = "Open float diagnostics panel",
		},
	},
	opts = function()
		return {
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
			folds = {
				enabled = true,
			},
			codelens = {
				enabled = false,
			},
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			servers = {
				["*"] = {
					keys = {
						{ "K", false },
					},
					capabilities = {
						workspace = {
							fileOperations = {
								didRename = true,
								willRename = true,
							},
						},
					},
				},
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
					filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
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
				sourcekit = {
					filetypes = { "swift" },
					capabilities = {
						workspace = {
							didChangeWatchedFiles = {
								dynamicRegistration = true,
							},
						},
					},
				},
				volar = {
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
					init_options = {
						vue = {
							-- disable hybrid mode
							hybridMode = false,
						},
					},
				},
				hls = {
					enabled = false,
				},
			},
			setup = {
				jdtls = function()
					return true
				end,
				rust_analyzer = function()
					return true
				end,
				clangd = function(_, opts)
					local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
					require("clangd_extensions").setup(
						vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts })
					)
					return false
				end,
			},
		}
	end,
}
