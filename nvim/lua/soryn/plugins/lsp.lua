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
            inlay_hints = {
                enabled = true,
            },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local lsputil = require("lspconfig/util")

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
                        flags = {
                            debounce_text_changes = 150
                        }
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

                ["ts_ls"] = function()
                    require("typescript-tools").setup({
                        on_attach = on_attach,
                        settings = {
                            expose_as_code_action = "all",
                        },
                        root_dir = lsputil.find_git_ancestor,
                    })
                end,

                ["eslint"] = function()
                    lspconfig["eslint"].setup({
                        capabilities = opts.capabilities,
                        on_attach = on_attach,
                        settings = {
                            useFlatConfig = true,
                            workingDirectory = {
                                mode = "location"
                            }
                        },
                        root_dir = lsputil.find_git_ancestor,
                    })
                end,

                ["astro"] = function()
                    lspconfig["astro"].setup({
                        capabilities = opts.capabilities,
                        on_attach = on_attach,
                        filetypes = { "astro" },
                        root_dir = lsputil.find_git_ancestor,
                    })
                end,

                ["rust_analyzer"] = function()
                    lspconfig["rust_analyzer"].setup({
                        capabilities = opts.capabilities,
                        on_attach = on_attach,
                        filetypes = { "rust" },
                        root_dir = lsputil.root_pattern("Cargo.toml"),
                        settings = {
                            ["rust-analyzer"] = {
                                cargo = {
                                    allFeatures = true,
                                },
                            },
                        },
                    })
                end,
            })

            vim.api.nvim_exec_autocmds("FileType", {})
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
                "astro",
                "stylua",
                "shfmt",
                "tsserver",
                "eslint-lsp",
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
        "luckasRanarison/tailwind-tools.nvim", -- tailwind utilities with lsp
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            document_color = {
                kind = "background",
            },
        },
    },
    {
        "zeioth/garbage-day.nvim", -- free RAM by stopping lsp when idled to long
        enabled = false,
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
                    render_limit = 8, -- max msgs to show
                    done_ttl = 2,     -- how long done msgs should still be visible
                },
            },
            notification = {
                window = {
                    winblend = 0, -- make notificatin window transparent
                },
            },
        },
    },
    {
        "rachartier/tiny-code-action.nvim", -- code actions visualizer
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        event = "LspAttach",
        config = function()
            local tca = require("tiny-code-action")

            vim.keymap.set({ "n", "v" }, "<leader>ca", function()
                tca.code_action()
            end, { noremap = true, silent = true })

            tca.setup({
                backend = "vim"
            })
        end
    }
}
