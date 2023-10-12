return {
    {
        "folke/which-key.nvim", -- show popup for shortcut help
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "numToStr/Comment.nvim", -- comment out lines/blocks easier
        event = { "BufReadPre", "BufNewFile" },
        opts = {}
    },
    {
        "stevearc/dressing.nvim", -- make input use telescope for better ui
        event = "VeryLazy"
    },
    {
        "kylechui/nvim-surround", -- surround things a looooot easier
        version = "*",
        event = "VeryLazy",
        opts = {}
    },
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
       "windwp/nvim-autopairs", -- automatically add pairs for (){}[]''""``
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true
            })
        end
    },
    {
        "lewis6991/gitsigns.nvim", -- show git line status in gutter
        lazy = false,
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
        "kdheepak/lazygit.nvim", -- lazygit inside neovim
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function()
            require("lsp_signature").setup({})
        end
    }
}
