return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
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
                    additional_vim_regex_highlighting = false
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
        end
    }
}
