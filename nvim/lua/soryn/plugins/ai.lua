return {
    {
        "Exafunction/codeium.vim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- Disable automatic codeium suggeastions.
            vim.g.codeium_manual = true
        end
    },

}
