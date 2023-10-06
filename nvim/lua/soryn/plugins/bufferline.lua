return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            mode = "buffers", -- keep track of the buffers
            seperator_style = "thick", -- make the tab styling thicc
            offsets = { -- don't consider nvim-tree to be a buffer, and replace the text (currently a bit bugged)
                {
                    filetype = "NvimTree",
                    text = "Filetree",
                    text_align = "center",
                    separator = true
                }
            },
        },
    },
}
