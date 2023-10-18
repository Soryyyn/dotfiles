return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/playground",
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"lua", "typescript", "javascript", "html", "json", "markdown"}, -- make sure the following parser are installed
                sync_install = false,
                auto_install = true,
                indent = {
                    enable = true
                },
                highlight = {
                    enable = true,
                },
                incremental_selection = { -- increment selection of syntax
                    enable = true,
                    keymaps = {
                        init_selection = "<C-Space>",
                        node_incremental = "<C-Space>",
                    }
                },
                autotag = {
                    enable = true
                }
            })

            -- commenting in mixed frontend context
            require("ts_context_commentstring").setup({})
        end
    },
    {
        "windwp/nvim-ts-autotag", -- auto edit html tags based on treesitter context
        event = "InsertEnter",
        opts = {}
    }
}
