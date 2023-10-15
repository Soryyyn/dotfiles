return {
    {
        "NvChad/nvim-colorizer.lua", -- color the background of colors
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("colorizer").setup({
                user_default_options = {
                    tailwind = true
                }
            })
        end
    },
    {
        "numToStr/Comment.nvim", -- comment out lines/blocks easier
        event = { "BufReadPre", "BufNewFile" },
        opts = {}
    },
    {
        "kylechui/nvim-surround", -- surround things a looooot easier
        version = "*",
        event = "VeryLazy",
        opts = {}
    },
    {
       "windwp/nvim-autopairs", -- automatically add pairs for (){}[]''""``
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true
            })
        end
    },
    {
        "nvim-telescope/telescope.nvim", -- explorer
        version = "*",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            }
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    color_devicons = true,
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                        }
                    }
                }
            })

            telescope.load_extension("fzf")
        end
    },
    {
        "RRethy/vim-illuminate", -- highlight same word when cursor is over it
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" }
            },
            under_cursor = false
        },
        config = function(_, opts)
            local illuminate = require("illuminate")

            -- keybindings
            vim.keymap.set("n", "<C-r>", illuminate.goto_next_reference, { desc = "Goto next reference" })

            illuminate.configure(opts)
        end
    }
}
