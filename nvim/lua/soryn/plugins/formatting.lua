return {
	{
		"stevearc/conform.nvim", -- formatting,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { { "prettier", "prettierd" } },
					typescript = { { "prettier", "prettierd" } },
					javascriptreact = { { "prettier", "prettierd" } },
					typescriptreact = { { "prettier", "prettierd" } },
					astro = { { "prettier", "prettierd" } },
					svelte = { { "prettier", "prettierd" } },
					css = { { "prettier", "prettierd" } },
					html = { { "prettier", "prettierd" } },
					json = { { "prettier", "prettierd" } },
					yaml = { { "prettier", "prettierd" } },
					markdown = { { "prettier", "prettierd" } },
					lua = { "stylua" },
					rust = { "rustfmt" },
					["_"] = { "trim_whitespace" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>cf", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format buffer" })
		end,
	},
}
