return {
    {
        "stevearc/conform.nvim", -- formatting,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    javascript = { "prettier", "prettierd", stop_after_first = true },
                    typescript = { "prettier", "prettierd", stop_after_first = true },
                    javascriptreact = { "prettier", "prettierd", stop_after_first = true },
                    typescriptreact = { "prettier", "prettierd", stop_after_first = true },
                    astro = { "prettier", "prettierd", stop_after_first = true },
                    svelte = { "prettier", "prettierd", stop_after_first = true },
                    css = { "prettier", "prettierd", stop_after_first = true },
                    html = { "prettier", "prettierd", stop_after_first = true },
                    json = { "prettier", "prettierd", stop_after_first = true },
                    yaml = { "prettier", "prettierd", stop_after_first = true },
                    markdown = { "prettier", "prettierd", stop_after_first = true },
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
