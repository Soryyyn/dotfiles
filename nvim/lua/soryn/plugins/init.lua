return {
    {
        "ray-x/lsp_signature.nvim", -- lsp signature help
        event = "VeryLazy",
        config = function()
            require("lsp_signature").setup({
                hint_enable = false,
            })
        end
    },
}
