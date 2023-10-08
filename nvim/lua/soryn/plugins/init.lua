return {
    {
      "folke/which-key.nvim", -- show popup for shortcut help
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {}
    },
    {
      "numToStr/Comment.nvim", -- comment out lines/blocks easier
      event = { "BufReadPre", "BufNewFile" },
      opts = {}
    },
    {
        "stevearc/dressing.nvim", -- make input use telescope for better ui
        event = "VeryLazy"
    }
}
