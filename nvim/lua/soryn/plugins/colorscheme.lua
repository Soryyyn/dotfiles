return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                terminal_colors = true,
                module_default = true,
                inverse = { -- inverse colors
                    match_paren = false,
                    cursor = true,
                    visual = true,
                    search = false,
                },
                styles = { -- set font styling based on word
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold"
                },
            }
        })

        vim.cmd("colorscheme carbonfox")
    end
}
