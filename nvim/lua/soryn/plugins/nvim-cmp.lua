return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for fs paths
        "onsails/lspkind.nvim", -- lsp completion
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets" -- just overall useful for snippets
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- load friendly snippets from plugins
        require("luasnip.loaders.from_vscode").lazy_load()

        -- setup the cmp
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect"
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(), -- show cmp
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-p>"] = cmp.mapping.scroll_docs(-4),
                ["<C-n>"] = cmp.mapping.scroll_docs(4),
                ["<C-q>"] = cmp.mapping.abort(), -- close cmp
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),

            -- cmp sources
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- current buffer
                { name = "path" }, -- fs paths,
            }),

            -- format the window to include icons etc.
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                })
            },
        })
    end
}
