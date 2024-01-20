return {
	{
		"stevearc/dressing.nvim", -- better ui
		event = "VeryLazy",
	},
	-- {
	-- 	"akinsho/bufferline.nvim", -- buffer "tabs" & tab indicators
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	version = "*",
	-- 	opts = {
	-- 		options = {
	-- 			mode = "buffers", -- keep track of the buffers
	-- 			seperator_style = "thick", -- make the tab styling thicc
	-- 			diagnostics = "nvim_lsp",
	-- 			offsets = {
	-- 				{
	-- 					filetype = "neo-tree",
	-- 					text = "Filetree",
	-- 					highlight = "Directory",
	-- 					text_align = "left",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("bufferline").setup(opts)
	--
	-- 		-- fix bufferline not appearing when restoring session
	-- 		vim.api.nvim_create_autocmd("BufAdd", {
	-- 			callback = function()
	-- 				vim.schedule(function()
	-- 					---@diagnostic disable-next-line: undefined-global
	-- 					pcall(nvim_bufferline)
	-- 				end)
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-lualine/lualine.nvim", -- statusline
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					disabled_filetypes = {
						statusline = {
							"dashboard",
						},
					},
				},
			})
		end,
	},
	{
		"folke/which-key.nvim", -- show popup for shortcut help
		opts = {
			defaults = {
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>g"] = { name = "+git" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>s"] = { name = "+session" },
				["<leader>q"] = { name = "+quickfix" },
				["<leader>r"] = { name = "+replace" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	{
		"kdheepak/lazygit.nvim", -- lazygit inside neovim
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim", -- filetree
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = true,
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
				follow_current_file = {
					enabled = true,
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim", -- show git line status in gutter
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					untracked = { text = "+" },
					change = { text = "~" },
					changedelete = { text = "~" },
					delete = { text = "-" },
					topdelete = { text = "-" },
				},
				current_line_blame = true,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			scope = {
				enabled = false,
			},
			exclude = {
				filetypes = {
					"neo-tree",
					"dashboard",
					"help",
					"lazy",
					"mason",
				},
			},
		},
	},
	{
		"utilyre/barbecue.nvim", -- winbar
		name = "barbecue",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	-- {
	-- 	"luukvbaal/statuscol.nvim", -- change statuscol
	-- 	config = function()
	-- 		local builtin = require("statuscol.builtin")
	--
	-- 		require("statuscol").setup({
	-- 			setopt = true,
	-- 			relculright = true,
	-- 			segments = {
	-- 				{
	-- 					text = {
	-- 						builtin.foldfunc,
	-- 						"",
	-- 					},
	-- 					click = "v:lua.ScFa",
	-- 					hl = "Comment",
	-- 				},
	-- 				{ text = { "%s" }, click = "v:lua.ScSa" },
	-- 				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"kevinhwang91/nvim-ufo", -- folding,
	-- 	dependencies = {
	-- 		"kevinhwang91/promise-async",
	-- 		"luukvbaal/statuscol.nvim",
	-- 	},
	-- 	config = function()
	-- 		local builtin = require("statuscol.builtin")
	--
	-- 		-- setup statuscol
	-- 		require("statuscol").setup({
	-- 			setopt = true,
	-- 			relculright = true,
	-- 			segments = {
	-- 				{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", hl = "Comment" },
	-- 				{ text = { "%s" }, click = "v:lua.ScSa" },
	-- 				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	-- 			},
	-- 		})
	--
	-- 		-- folding settings
	-- 		vim.o.foldcolumn = "1" -- '0' is not bad
	-- 		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	-- 		vim.o.foldlevelstart = 99
	-- 		vim.o.foldenable = true
	-- 		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
	--
	-- 		require("ufo").setup({
	-- 			close_fold_kinds = {},
	-- 			preview = {
	-- 				win_config = {
	-- 					border = { "", "─", "", "", "", "─", "", "" },
	-- 					winhighlight = "Normal:Folded",
	-- 					winblend = 0,
	-- 				},
	-- 				mappings = {
	-- 					scrollU = "<C-k>",
	-- 					scrollD = "<C-j>",
	-- 					jumpTop = "[",
	-- 					jumpBot = "]",
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		-- remaps
	-- 		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	-- 		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	-- 		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
	-- 		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
	-- 		vim.keymap.set("n", "zK", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })
	-- 	end,
	-- },
	{
		"nvimdev/dashboard-nvim", -- better start screen
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("dashboard").setup({
				theme = "doom",
				hide = {
					statusline = false,
				},
				config = {
					header = {
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						" ⣿⣿⣷⡁⢆⠈⠕⢕⢂⢕⢂⢕⢂⢔⢂⢕⢄⠂⣂⠂⠆⢂⢕⢂⢕⢂⢕⢂⢕⢂ ",
						" ⣿⣿⣿⡷⠊⡢⡹⣦⡑⢂⢕⢂⢕⢂⢕⢂⠕⠔⠌⠝⠛⠶⠶⢶⣦⣄⢂⢕⢂⢕ ",
						" ⣿⣿⠏⣠⣾⣦⡐⢌⢿⣷⣦⣅⡑⠕⠡⠐⢿⠿⣛⠟⠛⠛⠛⠛⠡⢷⡈⢂⢕⢂ ",
						" ⠟⣡⣾⣿⣿⣿⣿⣦⣑⠝⢿⣿⣿⣿⣿⣿⡵⢁⣤⣶⣶⣿⢿⢿⢿⡟⢻⣤⢑⢂ ",
						" ⣾⣿⣿⡿⢟⣛⣻⣿⣿⣿⣦⣬⣙⣻⣿⣿⣷⣿⣿⢟⢝⢕⢕⢕⢕⢽⣿⣿⣷⣔ ",
						" ⣿⣿⠵⠚⠉⢀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢕⢕⢕⢕⢕⢕⣽⣿⣿⣿⣿ ",
						" ⢷⣂⣠⣴⣾⡿⡿⡻⡻⣿⣿⣴⣿⣿⣿⣿⣿⣿⣷⣵⣵⣵⣷⣿⣿⣿⣿⣿⣿⡿ ",
						" ⢌⠻⣿⡿⡫⡪⡪⡪⡪⣺⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃ ",
						" ⠣⡁⠹⡪⡪⡪⡪⣪⣾⣿⣿⣿⣿⠋⠐⢉⢍⢄⢌⠻⣿⣿⣿⣿⣿⣿⣿⣿⠏⠈ ",
						" ⡣⡘⢄⠙⣾⣾⣾⣿⣿⣿⣿⣿⣿⡀⢐⢕⢕⢕⢕⢕⡘⣿⣿⣿⣿⣿⣿⠏⠠⠈ ",
						" ⠌⢊⢂⢣⠹⣿⣿⣿⣿⣿⣿⣿⣿⣧⢐⢕⢕⢕⢕⢕⢅⣿⣿⣿⣿⡿⢋⢜⠠⠈ ",
						" ⠄⠁⠕⢝⡢⠈⠻⣿⣿⣿⣿⣿⣿⣿⣷⣕⣑⣑⣑⣵⣿⣿⣿⡿⢋⢔⢕⣿⠠⠈ ",
						" ⠨⡂⡀⢑⢕⡅⠂⠄⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⢔⢕⢕⣿⣿⠠⠈ ",
						" ⠄⠪⣂⠁⢕⠆⠄⠂⠄⠁⡀⠂⡀⠄⢈⠉⢍⢛⢛⢛⢋⢔⢕⢕⢕⣽⣿⣿⠠⠈ ",
						"",
						"",
					},
					center = {
						{
							action = "Telescope find_files",
							desc = " Find files",
							icon = " ",
							key = "f",
						},
						{ action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
						{ action = "Telescope live_grep", desc = " Find text", icon = " ", key = "t" },
						{ action = "LazyGit", desc = " Repo (lazygit)", icon = " ", key = "g" },
						{
							action = 'lua require("persistence").load()',
							desc = " Restore session",
							icon = " ",
							key = "s",
						},
						{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					},
				},
			})
		end,
	},
}
