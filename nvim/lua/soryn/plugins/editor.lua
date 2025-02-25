return {
    {
        "NvChad/nvim-colorizer.lua", -- color the background of colors (using fork currently for tailwind colors)
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("colorizer").setup({})
        end,
    },
    {
        "folke/ts-comments.nvim", -- expand native comments for typescript contexts
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
    -- {
    --     "kylechui/nvim-surround", -- surround things a looooot easier
    --     version = "*",
    --     event = "VeryLazy",
    --     opts = {},
    -- },
    {
        "windwp/nvim-autopairs", -- automatically add pairs for (){}[]''""``
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim", -- explorer
        version = "*",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "natecraddock/telescope-zf-native.nvim",
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                version = "^1.0.0",
            },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local lga_actions = require("telescope-live-grep-args.actions")

            telescope.setup({
                defaults = {
                    color_devicons = true,
                    path_display = { "truncate" },
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                        },
                    },
                    sorting_strategy = "ascending",
                    cache_picker = {
                        num_pickers = 8,
                    },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                        },
                    },
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_mru = true,
                        mappings = {
                            n = {
                                ["<DELETE>"] = actions.delete_buffer,
                            },
                        },
                    },
                },
                extensions = {
                    live_grep_args = {
                        auto_quoting = true,
                        mappings = {
                            i = {
                                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                                ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
                            },
                        },
                    },
                },
            })

            -- better fuzzy sorting
            telescope.load_extension("zf-native")

            -- pass args and more to ripgrep (live grep)
            telescope.load_extension("live_grep_args")
        end,
    },
    {
        "axelvc/template-string.nvim", -- automatic template string converting
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/todo-comments.nvim", -- highlight todo comments
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "cappyzawa/trim.nvim", -- automatically trim trailing whitespace
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "Aasim-A/scrollEOF.nvim", -- scroll past eof
        event = { "CursorMoved", "WinScrolled" },
        opts = {},
    },
    {
        "echasnovski/mini.surround", -- surrounding
        version = "*",
        config = function()
            require("mini.surround").setup()
        end
    },
    {
        "jinh0/eyeliner.nvim", -- make finding place to jump with f/t
        config = function()
            require("eyeliner").setup({
                highlight_on_key = true
            })
        end
    },
    {
        "xzbdmw/clasp.nvim",
        config = function()
            require("clasp").setup({
                pairs = { ["{"] = "}", ['"'] = '"', ["'"] = "'", ["("] = ")", ["["] = "]", ["<"] = ">" },
                -- If called from insert mode, do not return to normal mode.
                keep_insert_mode = true,
            })

            -- jumping from smallest region to largest region
            vim.keymap.set({ "n", "i" }, "<c-l>", function()
                require("clasp").wrap('next')
            end)
        end
    }
}
