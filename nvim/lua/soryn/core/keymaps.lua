-- set global leader key to space
vim.g.mapleader = " "

-- better highlight clearing (escape and clear)
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<CR><esc>", { desc = "Exit mode and clear highlight" })

-- change undo bindings to all be on one key
vim.keymap.set("n", "<S-u>", "<C-r>", { desc = "Redo" })

-- easier window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- switch buffers
vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previos buffer", silent = true })

-- buffer selecting, closing, etc.
vim.keymap.set(
	"n",
	"<leader>bd",
	"<cmd>lua MiniBufremove.delete(0)<CR>",
	{ desc = "Close current buffer", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>bD",
	"<cmd>lua MiniBufremove.delete(0, true)<CR>",
	{ desc = "Close current buffer (force)", silent = true }
)
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick from open buffers", silent = true })

-- telescope bindings
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODO comments (and more)" })

-- lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- open filetree
vim.keymap.set("n", "<leader><space>", "<cmd>Neotree toggle<CR>", { desc = "Open filetree" })

-- Change window sizes easier
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase window height", noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease window height", noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "<C-w>>", { desc = "Increase window height", noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w><", { desc = "Decrease window height", noremap = true, silent = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- increment & decrement number with plus and minus
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- move lines/blocks
vim.keymap.set("n", "<M-k>", "<cmd>MoveLine -1<CR>", { desc = "Move line up", silent = true, noremap = true })
vim.keymap.set("n", "<M-j>", "<cmd>MoveLine 1<CR>", { desc = "Move line down", silent = true, noremap = true })
vim.keymap.set("v", "<M-k>", ":MoveBlock -1<CR>", { desc = "Move block up", silent = true, noremap = true })
vim.keymap.set("v", "<M-j>", ":MoveBlock 1<CR>", { desc = "Move block down", silent = true, noremap = true })

-- toggle error/warning overview
vim.keymap.set("n", "<leader>cd", "<cmd>TroubleToggle<CR>", { desc = "Toggle code diagnostics", silent = true })

-- toggleable terminal
vim.keymap.set(
	{ "n", "t" },
	"<F12>",
	"<cmd>ToggleTerm<CR>",
	{ desc = "Toggle terminal", silent = true, noremap = true }
)

-- quickfix navigation
vim.keymap.set("n", "<leader>qq", "<CMD>QFToggle<CR>", { desc = "Toggle quickfix list" })
vim.keymap.set("n", "<leader>qc", "<CMD>Cclear<CR>", { desc = "Clear quickfix list" })
vim.keymap.set("n", "<C-n>", "<CMD>QFNext<CR>", { desc = "Goto next quickfix list entry" })
vim.keymap.set("n", "<C-p>", "<CMD>QFPrev<CR>", { desc = "Goto previous quickfix list entry" })
