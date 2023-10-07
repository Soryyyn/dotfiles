return {
    "projekt0n/github-nvim-theme",
    lazy = false,                               -- loading at start
    priority = 1000,                            -- high prio
    config = function()
        local theme = require("github-theme")

        theme.setup({
            options = {
                hide_end_of_buffer = true,      -- hide "~" on line
                terminal_colors = true,
                inverse = {                     -- inverse colors
                    match_paren = false,
                    visual = true,
                    search = false,
                },
                styles = {                      -- set font styling based on word
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold"
                },
            },
            groups = {
                all = {
                    TelescopeMatching = {
                        fg = "fg1",
                        bg = "palette.red"
                    },
                    TelescopeSelection = {
                        fg = "fg1",
                        bg = "bg1",
                        bold = true
                    },
                    TelescopePromptPrefix = {
                        bg = "bg0"
                    },
                    TelescopePromptNormal = {
                        bg = "bg0",
                    },
                    TelescopeResultsNormal = {
                        bg = "bg1"
                    },
                    TelescopePreviewNormal = {
                        bg = "bg1"
                    },
                    TelescopePromptBorder = {
                        bg = "bg0",
                        fg = "bg0"
                    },
                    TelescopeResultsBorder = {
                        bg = "bg1",
                        fg = "bg1"
                    },
                    TelescopePreviewBorder = {
                        bg = "bg1",
                        fg = "bg1"
                    },
                    TelescopePromptTitle = {
                        bg = "palette.magenta",
                        fg = "bg1"
                    },
                    TelescopeResultsTitle = {
                        fg = "fg1",
                    },
                    TelescopePreviewTitle = {
                        bg = "palette.blue",
                        fg = "bg1"
                    }
                }
            }
        })

        vim.cmd("colorscheme github_dark")
    end,
}
