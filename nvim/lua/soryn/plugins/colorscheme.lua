return {
    "projekt0n/github-nvim-theme",
    lazy = false,                               -- loading at start
    priority = 1000,                            -- high prio
    config = function()
        require("github-theme").setup({
            options = {
                hide_end_of_buffer = true,      -- hide "~" on line
                transparent = true,             -- paint bg
                inverse = {                     -- inverse colors
                    match_paren = false,
                    visual = true,
                    search = false,
                },
                styles = {                      -- set font styling based on word
                    comments = "italic",
                    keywords = "bold"
                }
            }
        })

        vim.cmd("colorscheme github_dark")
    end,
}