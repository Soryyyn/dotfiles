return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                terminal_colors = true,
                module_default = true,
                hide_end_of_buffer = false,
                inverse = { -- inverse colors
                    match_paren = false,
                    visual = true,
                    search = false,
                },
                styles = { -- set font styling based on word
                    comments = "italic",
                },
            },
            groups = {
                all = {
                    illuminatedWordRead = {
                        bg = "bg2"
                    },
                    illuminatedWordWrite = {
                        bg = "bg2"
                    },
                }
            }
        })

        vim.cmd("colorscheme carbonfox")
    end
}
