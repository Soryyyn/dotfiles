return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true }
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = function(_, bufnr)
            -- keybinds
            vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show references", noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show definition(s)", noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show implementations", noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show type definitions", noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions", noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n" ,"K", vim.lsp.buf.hover, { desc = "Show doc for what is under cursor", noremap = true, silent = true, buffer = bufnr })
        end

        local capabilities = cmp_nvim_lsp.default_capabilities() -- used for autocompletion

        -- better signatures
        require("lsp_signature").setup({})

        -- change diagnostic icons in gutter
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        require("mason-lspconfig").setup_handlers({
            -- default server setup
            function(server)
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach
                })
            end,

            -- special lua setup
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            },
                            workspace = {
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true
                                }
                            }
                        }
                    }
                })
            end
        })
    end
}
