return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        mason_lspconfig.setup({
            automatic_installation = true, -- automatically install the configured servers
            ensure_installed = {
                "html",
                "cssls",
                "tailwindcss",
                "lua_ls",
                "emmet_ls"
            },
        })

    end
}
