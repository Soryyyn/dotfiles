math.randomseed(os.time())
local shinyChance = math.random(0, 100)
local chosenShinyOdd = math.random(0, 100)

return {
    {
        "sindrets/diffview.nvim", -- better diff & merge mode
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cmd = "DiffviewOpen",
        opts = {},
    },
    {
        "folke/persistence.nvim", -- session saving & tracking
        event = "BufReadPre",
        opts = {
            options = {
                "buffers",
                "curdir",
                "tabpages",
                "winsize",
                "help",
                "globals",
                "skiprtp",
            },
        },
        keys = {
            {
                "<leader>sr",
                function()
                    require("persistence").load()
                end,
                desc = "Restore session",
            },
            {
                "<leader>sl",
                function()
                    require("persistence").load({ last = true })
                end,
                desc = "Restore last session",
            },
            {
                "<leader>sd",
                function()
                    require("persistence").stop()
                end,
                desc = "Don't save current session",
            },
        },
    },
    {
        "folke/trouble.nvim", -- better error/warning overview
        event = "LspAttach",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
    {
        "akinsho/toggleterm.nvim", -- able to create a terminal session inside vim
        version = "*",
        opts = {
            direction = "float",
            float_opts = {
                border = "curved",
            },
        },
    },
    {
        "stevearc/quicker.nvim", -- quickfix list improvements
        event = "VeryLazy",
        config = function()
            require("quicker").setup({
                keys = {
                    {
                        ">",
                        function()
                            require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
                        end,
                        desc = "Expand quickfix context",
                    },
                    {
                        "<",
                        function()
                            require("quicker").collapse()
                        end,
                        desc = "Collapse quickfix context",
                    },
                },
            })
        end
    },
    -- {
    --     "roobert/search-replace.nvim", -- better search & replace
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --         require("search-replace").setup({})
    --     end,
    -- },
    {
        "MagicDuck/grug-far.nvim", -- search & replace
        config = function()
            require("grug-far").setup({})
        end
    },
    {
        "chrisgrieser/nvim-early-retirement", -- close buffers if they have been open for too long
        config = true,
        event = "VeryLazy",
    },
    {
        "folke/snacks.nvim", -- collection of utilities
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = {
                sections = {
                    { section = "header" },
                    { section = "keys",   gap = 1, padding = 1 },
                    { section = "startup" },
                    {
                        section = "terminal",
                        cmd = string.format("pokemon-colorscripts -r%s; sleep 0.5",
                            shinyChance == chosenShinyOdd and " --shiny" or ""),
                        random = 100,
                        pane = 2,
                        indent = 4,
                        height = 30,
                    },
                },
            },
            bigfile = { enabled = true },
            lazygit = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Open Lazygit" },
            { "]r",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next LSP Reference", mode = { "n", "t" } },
            { "[r",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev LSP Reference", mode = { "n", "t" } },
        }
    },
    {
        "pwntester/octo.nvim", -- pr reviewing
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("octo").setup({})
        end
    }
}
