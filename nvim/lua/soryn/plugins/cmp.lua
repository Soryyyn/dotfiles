return {
    {
        "hrsh7th/nvim-cmp", -- main completion plugin
        version = false,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
            {
                "js-everts/cmp-tailwind-colors",
                config = true,
            },
        },
        opts = function()
            local cmp = require("cmp")
            local default_cmp_settings = require("cmp.config.default")()

            require("luasnip.loaders.from_vscode").lazy_load()

            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(), -- show cmp
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-p>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-n>"] = cmp.mapping.scroll_docs(4),
                    ["<C-q>"] = cmp.mapping.abort(), -- close cmp
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 35,
                        ellipsis_char = "...",
                        before = function(entry, vim_item)
                            vim_item = require("cmp-tailwind-colors").format(entry, vim_item)
                            return vim_item
                        end,
                    }),
                },
                sorting = default_cmp_settings.sorting,
                experimental = {
                    ghost_text = true
                }
            }
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },
}
