return {
	{
		"sindrets/diffview.nvim", -- better diff & merge mode
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "DiffviewOpen",
		opts = {},
	},
	{
		"folke/persistence.nvim", -- session saving & tracking
		event = "BufReadPre",
		opts = {
			options = {
				"buffers",
				"curdir",
				"tabpages",
				"winsize",
				"help",
				"globals",
				"skiprtp",
			},
		},
		keys = {
			{
				"<leader>qr",
				function()
					require("persistence").load()
				end,
				desc = "Restore session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore last session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't save current session",
			},
		},
	},
	{
		"folke/trouble.nvim", -- better error/warning overview
		event = "LspAttach",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"echasnovski/mini.bufremove", -- better buffer closing, deleting, wiping whilst respecting window layout
		version = "*",
		config = function()
			require("mini.bufremove").setup({})
		end,
	},
	{
		"akinsho/toggleterm.nvim", -- able to create a terminal session inside vim
		version = "*",
		opts = {
			direction = "float",
			float_opts = {
				border = "curved",
			},
		},
	},
}
