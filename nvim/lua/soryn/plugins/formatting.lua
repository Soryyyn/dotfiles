return {
	{
		"stevearc/conform.nvim", -- formatting,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { { "biome", "prettier", "prettierd" } },
					typescript = { { "biome", "prettier", "prettierd" } },
					javascriptreact = { { "biome", "prettier", "prettierd" } },
					typescriptreact = { { "biome", "prettier", "prettierd" } },
					svelte = { { "biome", "prettier", "prettierd" } },
					css = { { "biome", "prettier", "prettierd" } },
					html = { { "biome", "prettier", "prettierd" } },
					json = { { "biome", "prettier", "prettierd" } },
					yaml = { { "biome", "prettier", "prettierd" } },
					markdown = { { "biome", "prettier", "prettierd" } },
					lua = { "stylua" },
					["_"] = { "trim_whitespace" },
					["*"] = { "codespell" },
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
