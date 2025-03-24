return {
    {
        "stevearc/oil.nvim", -- file explorer like buffer
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("oil").setup({
                skip_confirm_for_simple_edits = true,
                view_options = {
                    show_hidden = true,
                },
            })
        end,
    },
    {
        "pnx/lualine-lsp-status", -- show lsp servers in statusline
    },
    {
        "nvim-lualine/lualine.nvim", -- statusline
        event = { "BufReadPost", "BufNewFile", "VeryLazy" },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    component_separators = "",
                    globalstatus = true,
                    section_separators = {
                        left = "",
                        right = "",
                    },
                    disabled_filetypes = {
                        statusline = {
                            "dashboard",
                        },
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "filename",
                        {
                            "branch",
                            seperator = {
                                right = "",
                            }
                        }
                    },
                    lualine_c = { "diagnostics" },
                    lualine_x = { "lsp-status" },
                    lualine_y = {
                        {
                            "filetype",
                            seperator = {
                                left = "",
                            }
                        },
                    },
                    lualine_z = { "location" },
                },
            })
        end,
    },
    {
        "folke/which-key.nvim", -- show popup for shortcut help
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.add({
                { "<leader>c", group = "code" },
                { "<leader>d", group = "diagnostics" },
                { "<leader>f", group = "file/find" },
                { "<leader>r", group = "replace" },
                { "<leader>s", group = "session" },
                { "<leader>w", group = "window" },
                { "<leader>g", group = "git" },
            })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim", -- filetree
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            close_if_last_window = true,
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                },
                follow_current_file = {
                    enabled = true,
                },
            },
            window = {
                position = "right"
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim", -- show git line status in gutter
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    changedelete = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                },
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            scope = {
                enabled = false,
            },
            exclude = {
                filetypes = {
                    "neo-tree",
                    "dashboard",
                    "help",
                    "lazy",
                    "mason",
                },
            },
        },
    },
    {
        "xiyaowong/transparent.nvim", -- transparency
        config = function()
            require("transparent").setup({
                exclude_groups = {
                    "CursorLine",
                    "CursorLineNr",
                },
            })
        end,
    },
    {
        "Bekaboo/dropbar.nvim", -- breadcrumbs
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
    },
    {
        "OXY2DEV/markview.nvim", -- better markdown render
        lazy = false
    }
}
