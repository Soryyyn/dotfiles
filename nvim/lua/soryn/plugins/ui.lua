return {
    {
        "nvim-tree/nvim-web-devicons", -- customize icons
        config = function()
            require("nvim-web-devicons").setup({
                strict = true,
                override_by_extension = {
                    astro = {
                        icon = "",
                        color = "#EF8547",
                        name = "astro",
                    }
                }
            })
        end
    },
    {
        "stevearc/oil.nvim", -- file explorer like buffer
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("oil").setup({
                skip_confirm_for_simple_edits = true,
                view_options = {
                    show_hidden = true,
                }
            })
        end
    },
    {
        "stevearc/dressing.nvim", -- better ui
        event = "VeryLazy",
    },
    {
        "nvim-lualine/lualine.nvim", -- statusline
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    component_separators = "",
                    section_separators = {
                        left = "",
                        right = ""
                    },
                    disabled_filetypes = {
                        statusline = {
                            "dashboard",
                        },
                    },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            separator = {
                                left = ""
                            },
                            right_padding = 2
                        }
                    },
                    lualine_b = { "filename", "branch" },
                    lualine_c = { "%=" },
                    lualine_x = {},
                    lualine_y = { "filetype" },
                    lualine_z = { "progress", {
                        "location",
                        separator = {
                            right = ""
                        },
                        left_padding = 2
                    } }
                },
            })
        end,
    },
    {
        "folke/which-key.nvim", -- show popup for shortcut help
        opts = {
            defaults = {
                ["<leader>c"] = { name = "+code" },
                ["<leader>f"] = { name = "+file/find" },
                ["<leader>s"] = { name = "+session" },
                ["<leader>q"] = { name = "+quickfix" },
                ["<leader>r"] = { name = "+replace" },
                ["<leader>w"] = { name = "+window" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },
    {
        "kdheepak/lazygit.nvim", -- lazygit inside neovim
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
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
                current_line_blame = true,
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
        "nvimdev/dashboard-nvim", -- better start screen
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("dashboard").setup({
                theme = "doom",
                hide = {
                    statusline = false,
                },
                config = {
                    header = {
                        [[                                                   ]],
                        [[                                              ___  ]],
                        [[                                           ,o88888 ]],
                        [[                                        ,o8888888' ]],
                        [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
                        [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
                        [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
                        [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
                        [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
                        [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
                        [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
                        [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
                        [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
                        [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
                        [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
                        [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
                        [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
                        [[     ...:.'.:.::::"'    . . . . .'                 ]],
                        [[    .. . ....:."' `   .  . . ''                    ]],
                        [[  . . . ...."'                                     ]],
                        [[  .. . ."'                                         ]],
                        [[ .                                                 ]],
                        [[                                                   ]],
                    },
                    center = {
                        {
                            action = "Telescope find_files",
                            desc = " Find [F]iles",
                            icon = " ",
                            key = "f",
                        },
                        { action = "Telescope live_grep_args", desc = " Find [S]tring", icon = " ", key = "s" },
                        { action = "Oil", desc = " File [E]xplorer", icon = " ", key = "e" },
                        { action = "LazyGit", desc = " Lazy[G]it repo", icon = " ", key = "g" },
                        {
                            action = 'lua require("persistence").load()',
                            desc = " [R]estore session",
                            icon = " ",
                            key = "r",
                        },
                        { action = "Lazy", desc = " [L]azy", icon = "󰒲 ", key = "l" },
                    },
                },
            })
        end,
    },
}
