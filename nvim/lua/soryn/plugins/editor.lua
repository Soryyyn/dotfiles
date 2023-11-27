return {
	{
		"NvChad/nvim-colorizer.lua", -- color the background of colors
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"themaxmarchuk/tailwindcss-colors.nvim", -- use tailwind lsp to highlight colors
		event = "LspAttach",
		name = "tailwindcss-colors",
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},
	{
		"numToStr/Comment.nvim", -- comment out lines/blocks easier
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"kylechui/nvim-surround", -- surround things a looooot easier
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-autopairs", -- automatically add pairs for (){}[]''""``
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim", -- explorer
		version = "*",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					color_devicons = true,
					path_display = { "truncate" },
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
						},
					},
					sorting_strategy = "ascending",
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
				},
			})

			telescope.load_extension("fzf")
		end,
	},
	{
		"RRethy/vim-illuminate", -- highlight same word when cursor is over it
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
			under_cursor = false,
		},
		config = function(_, opts)
			local illuminate = require("illuminate")

			-- keybindings
			vim.keymap.set(
				"n",
				"<C-r>",
				illuminate.goto_next_reference,
				{ desc = "Goto next reference", noremap = true }
			)

			illuminate.configure(opts)
		end,
	},
	{
		"ggandor/leap.nvim", -- text jumping (even better than easymotion)
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"hinell/move.nvim", -- move lines & blocks of code
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"axelvc/template-string.nvim", -- automatic template string converting
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/todo-comments.nvim", -- highlight todo comments
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"cappyzawa/trim.nvim", -- automatically trim trailing whitespace
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"f-person/git-blame.nvim", -- git blame info
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitblame").setup({
				delay = 1000,
				virtual_text_column = 80,
			})
		end,
	},
}
