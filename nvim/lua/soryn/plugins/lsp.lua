return {
	{
		"neovim/nvim-lspconfig", -- language server configuration
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"ray-x/lsp_signature.nvim",
			"pmizio/typescript-tools.nvim",
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
					"<CMD>Telescope lsp_references<CR>",
					{ desc = "Show references", silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gd",
					"<CMD>Telescope lsp_definitions<CR>",
					{ desc = "Show definition(s)", silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					{ desc = "Go to declaration", silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gi",
					"<CMD>Telescope lsp_implementations<CR>",
					{ desc = "Show implementations", silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"gt",
					"<CMD>Telescope lsp_type_definitions<CR>",
					{ desc = "Show type definitions", silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "See available code actions", silent = true, buffer = bufnr, noremap = true }
				)
				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					{ desc = "Hover information", remap = true, silent = true, buffer = bufnr }
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
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })

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

				["tailwindcss"] = function()
					lspconfig["tailwindcss"].setup({
						capabilities = opts.capabilities,
						on_attach = function(_, bufnr)
							require("tailwindcss-colors").buf_attach(bufnr)
							on_attach(_, bufnr)
						end,
					})
				end,

				["tsserver"] = function()
					require("typescript-tools").setup({
						on_attach = on_attach,
						settings = {
							expose_as_code_action = "all",
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
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"tsserver",
				"eslint_d",
				"prettier",
				"emmet_ls",
				"cssls",
				"html",
				"tailwindcss",
			},
			automatic_installation = true,
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	-- {
	-- 	"nvimtools/none-ls.nvim", -- formatting & linting
	-- 	event = "LspAttach",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		local none_ls = require("null-ls")
	-- 		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	--
	-- 		none_ls.setup({
	-- 			sources = {
	-- 				-- lua
	-- 				none_ls.builtins.formatting.stylua,
	--
	-- 				-- eslint
	-- 				none_ls.builtins.code_actions.eslint_d,
	-- 				none_ls.builtins.diagnostics.eslint_d,
	-- 				none_ls.builtins.formatting.eslint_d,
	--
	-- 				-- prettier
	-- 				none_ls.builtins.formatting.prettier,
	-- 			},
	-- 			on_attach = function(client, bufnr) -- format the file on save
	-- 				if client.supports_method("textDocument/formatting") then
	-- 					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 					vim.api.nvim_create_autocmd("BufWritePre", {
	-- 						group = augroup,
	-- 						buffer = bufnr,
	-- 						callback = function()
	-- 							vim.lsp.buf.format({ async = false })
	-- 						end,
	-- 					})
	-- 				end
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"pmizio/typescript-tools.nvim", -- additional typescript lsp tooling
		event = "LspAttach",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},
	{
		"zeioth/garbage-day.nvim", -- free RAM by stopping lsp when idled to long
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		event = "VeryLazy",
		opts = {
			notifications = true,
		},
	},
	{
		"antosha417/nvim-lsp-file-operations", -- trigger lsp actions when moving/renaming files
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"j-hui/fidget.nvim", -- lsp operations notifications
		opts = {
			progress = {
				display = {
					render_limit = 6,
					done_ttl = 1,
				},
			},
		},
	},
}
