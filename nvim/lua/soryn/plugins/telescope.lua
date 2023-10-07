return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        options = {
            defaults = {
                color_devicons = true,
                path_display = { "truncate" },
            }
        }
    end
}
