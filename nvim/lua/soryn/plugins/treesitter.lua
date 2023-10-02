return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"lua", "typescript", "javascript", "html", "json", "markdown"}, -- make sure the following parser are installed
            sync_install = false,
            auto_install = true,
            indent = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        })
    end
}
