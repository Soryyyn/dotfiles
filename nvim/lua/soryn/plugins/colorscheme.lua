return {
    "projekt0n/github-nvim-theme",
    lazy = false,                               -- loading at start
    priority = 1000,                            -- high prio
    config = function()
        require("github-theme").setup({
            options = {
                hide_end_of_buffer = false,     -- hide "~" on line
                transparent = true,             -- paint bg
                inverse = {                     -- inverse colors
                    match_paren = true,
                    visual = true,
                    search = true,
                },
                styles = {                      -- set font styling based on word
                    comments = "italic",
                    keywords = "bold"
                }
            }
        })

        vim.cmd("colorscheme github_dark_high_contrast")
    end,
}