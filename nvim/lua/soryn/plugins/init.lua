return {
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {}
    },
    {
      "numToStr/Comment.nvim",
      event = { "BufReadPre", "BufNewFile" },
      opts = {}
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                mode = "tabs",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text_align = "left", 
                    }
                },
            }
        }
    }
}
