return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
        hijack_cursor = true,

        -- render = {
        --     icons = {
        --         git_placement = "signcolumn",
        --     }
        -- },

        filters = {
            custom = {
                ".DS_Store",
                "^.git$"
            }
        }
    })
  end,
}