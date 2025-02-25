return {
    on_attach = function(_, bufnr)
        vim.keymap.set(
            "n",
            "gr",
            "<CMD>Telescope lsp_references<CR>",
            { desc = "Show references", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gd",
            "<CMD>Telescope lsp_definitions<CR>",
            { desc = "Show definition(s)", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { desc = "Go to declaration", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gi",
            "<CMD>Telescope lsp_implementations<CR>",
            { desc = "Show implementations", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gt",
            "<CMD>Telescope lsp_type_definitions<CR>",
            { desc = "Show type definitions", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            { desc = "Hover information", remap = true, silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "<leader>cf",
            vim.lsp.buf.format,
            { desc = "Format code", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "<leader>cr",
            vim.lsp.buf.rename,
            { desc = "Rename variable", silent = true, buffer = bufnr }
        )
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
    end
}
