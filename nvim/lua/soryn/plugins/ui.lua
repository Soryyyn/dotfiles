return {
    {
        "stevearc/dressing.nvim", -- better ui
        event = "VeryLazy"
    },
    {
        "akinsho/bufferline.nvim", -- buffer "tabs" & tab indicators
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        version = "*",
        opts = {
            options = {
                mode = "buffers", -- keep track of the buffers
                seperator_style = "thick", -- make the tab styling thicc
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Filetree",
                        highlight = "Directory",
                        text_align = "left"
                    }
                },
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim", -- statusline
        event = "VeryLazy",
        dependecies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {}
    },
    {
        "folke/which-key.nvim", -- show popup for shortcut help
        opts = {}
    },
    {
        "kdheepak/lazygit.nvim", -- lazygit inside neovim
        cmd = { "LazyGit" },
        dependencies = {
            "nvim-lua/plenary.nvim"
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
                "document_symbols"
            },
            filesystem = {
                follow_current_file = {
                    enabled = true
                }
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim", -- show git line status in gutter
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add          = { text = '▍' },
                    change       = { text = '▍' },
                    delete       = { text = '▶' },
                    topdelete    = { text = '▶' },
                    changedelete = { text = '~' },
                    untracked    = { text = '▍' },
                },
            })
        end
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            scope = {
                enabled = false
            }
        }
    }
}
