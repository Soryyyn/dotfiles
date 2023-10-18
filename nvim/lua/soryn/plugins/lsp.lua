return {
	{
		"neovim/nvim-lspconfig", -- language server configuration
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"ray-x/lsp_signature.nvim",
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
			},
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")

			-- keybinds which are attached to the lsp
			local on_attach = function(_, bufnr)
				vim.keymap.set(
					"n",
					"gr",
					"<cmd>Telescope lsp_references<CR>",
					{ desc = "Show references", noremap = true, silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					{ desc = "Show definition(s)", noremap = true, silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					{ desc = "Go to declaration", noremap = true, silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					{ desc = "Show implementations", noremap = true, silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					{ desc = "Show type definitions", noremap = true, silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "See available code actions", noremap = true, silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					{ desc = "Show doc for what is under cursor", noremap = true, silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"<leader>cf",
					vim.lsp.buf.format,
					{ desc = "Format code", silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"<leader>cr",
					vim.lsp.buf.rename,
					{ desc = "Rename variable", silent = true, buffer = bufnr }
				)

				-- attach function signature help
				require("lsp_signature").on_attach({
					floating_window_above_cur_line = false,
					floating_window = false,
					hint_prefix = " ",
				}, bufnr)
			end

			-- change diagnostic icons in gutter
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- setup for each lsp server
			require("mason-lspconfig").setup_handlers({
				-- default server setup (will get overwritten if the server is defined below)
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = opts.capabilities,
						on_attach = on_attach,
					})
				end,

				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = opts.capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim", -- language server installation, updating, etc
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
			},
			automatic_installation = true,
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"nvimtools/none-ls.nvim", -- formatting & linting
		event = "LspAttach",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local none_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			none_ls.setup({
				sources = {
					-- lua
					none_ls.builtins.formatting.stylua,

					-- eslint
					none_ls.builtins.code_actions.eslint_d,
					none_ls.builtins.diagnostics.eslint_d,
					none_ls.builtins.formatting.eslint_d,

					-- prettier
					none_ls.builtins.formatting.prettierd,
				},
				on_attach = function(client, bufnr) -- format the file on save
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
}
