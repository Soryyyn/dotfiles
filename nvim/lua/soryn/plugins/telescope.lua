return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        options = {
            defaults = {
                set_env = { ["COLORTERM"] = "truecolor" },
                color_devicons = true,
                border = {},
                path_display = { "truncate" },
                winblend = 0,
            }
        }
    end
}
