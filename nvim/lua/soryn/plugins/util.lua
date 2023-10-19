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
}
