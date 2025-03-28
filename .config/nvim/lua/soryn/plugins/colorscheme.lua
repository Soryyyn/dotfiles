return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    terminal_colors = true,
                    module_default = true,
                    inverse = { -- inverse colors
                        match_paren = false,
                        visual = true,
                        search = false,
                    },
                    styles = { -- set font styling based on word
                        comments = "italic",
                        keywords = "bold",
                        types = "italic,bold",
                    },
                },
                groups = {
                    all = {
                        illuminatedWordRead = {
                            bg = "bg2",
                        },
                        illuminatedWordWrite = {
                            bg = "bg2",
                        },
                    },
                },
            })
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({
                options = {
                    terminal_colors = true,
                    module_default = true,
                    styles = { -- set font styling based on word
                        comments = "italic",
                        keywords = "bold",
                        types = "italic,bold",
                    },
                },
                groups = {
                    all = {
                        illuminatedWordRead = {
                            bg = "bg2",
                        },
                        illuminatedWordWrite = {
                            bg = "bg2",
                        },
                    },
                },
            })

            -- vim.cmd("colorscheme github_dark_default")
        end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                styles = {
                    comments = { "italic" },
                    keywords = { "bold" },
                    types = { "italic", "bold" },
                },
            })

            vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("oldworld").setup({
                styles = {
                    comments = {
                        italic = true,
                    },
                    keywords = {
                        bold = true,
                    },
                },
                integrations = {
                    neo_tree = true,
                },
            })
        end,
    },
    {
        "zenbones-theme/zenbones.nvim",
        lazy = false,
        priority = 1000,
        dependencies = {
            "rktjmp/lush.nvim"
        },
        config = function()
            -- vim.cmd("colorscheme tokyobones")

            -- Some highlight changes.
            vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
                group = vim.api.nvim_create_augroup("Color", {}),
                pattern = "*",
                callback = function()
                    vim.api.nvim_set_hl(0, "Visual", { bg = "#2c4075", bold = true })
                    vim.api.nvim_set_hl(0, "@type.typescript", { bold = true, italic = true })
                end
            })
        end
    }
}
