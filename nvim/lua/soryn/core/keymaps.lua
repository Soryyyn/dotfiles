local km = vim.keymap

-- set global leader key to space
vim.g.mapleader = " "

-- better highlight clearing (escape and clear)
km.set({ "i", "n" }, "<esc>", "<CMD>noh<CR><esc>", { desc = "Exit mode and clear highlight" })

-- better half page scrolling (now with centering)
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")

-- paste selected text without yanking the replaced text
km.set("v", "<leader>p", '"_dP', { desc = "Paste text without yanking selected" })

-- change undo bindings to all be on one key
km.set("n", "<S-u>", "<C-r>", { desc = "Redo" })

-- easier window navigation
km.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
km.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
km.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
km.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- switch buffers
km.set("n", "<tab>", "<CMD>bnext<CR>", { desc = "Next buffer", silent = true })
km.set("n", "<S-tab>", "<CMD>bprev<CR>", { desc = "Previous buffer", silent = true })

-- buffer selecting, closing, etc.
-- km.set(
-- 	"n",
-- 	"<leader>bd",
-- 	"<CMD>lua MiniBufremove.delete(0)<CR>",
-- 	{ desc = "Close current buffer", silent = true }
-- )
-- km.set(
-- 	"n",
-- 	"<leader>bD",
-- 	"<CMD>lua MiniBufremove.delete(0, true)<CR>",
-- 	{ desc = "Close current buffer (force)", silent = true }
-- )
-- km.set("n", "<leader>bp", "<CMD>BufferLinePick<CR>", { desc = "Pick from open buffers", silent = true })
-- km.set("n", "<leader>bP", "<CMD>BufferLineTogglePin<CR>", { desc = "Pin buffer", silent = true })
-- km.set(
-- 	"n",
-- 	"<leader>bc",
-- 	"<CMD>BufferLineCloseOthers<CR>",
-- 	{ desc = "Close all buffers except active one", silent = true }
-- )
-- km.set("n", "<leader>bl", "<CMD>BufferLineCloseRight<CR>", { desc = "Close all buffers right", silent = true })
-- km.set("n", "<leader>bh", "<CMD>BufferLineCloseLeft<CR>", { desc = "Close all buffers left", silent = true })

-- telescope bindings
km.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find files in cwd" })
km.set("n", "<leader>fs", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
km.set("n", "<leader>fc", "<CMD>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
km.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Find open buffers" })
km.set("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Find TODO comments (and more)" })

-- lazygit
km.set("n", "<leader>gg", "<CMD>LazyGit<CR>", { desc = "Open LazyGit" })

-- open filetree
km.set("n", "<leader><space>", "<CMD>Neotree toggle<CR>", { desc = "Open filetree" })

-- Change window sizes easier
km.set("n", "<C-Up>", "<C-w>+", { desc = "Increase window height", noremap = true, silent = true })
km.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease window height", noremap = true, silent = true })
km.set("n", "<C-Left>", "<C-w>>", { desc = "Increase window height", noremap = true, silent = true })
km.set("n", "<C-Right>", "<C-w><", { desc = "Decrease window height", noremap = true, silent = true })

-- better indenting
km.set("v", "<", "<gv")
km.set("v", ">", ">gv")

-- increment & decrement number with plus and minus
km.set("n", "+", "<C-a>")
km.set("n", "-", "<C-x>")

-- move lines/blocks
km.set("n", "<M-k>", ":MoveLine -1<CR>", { desc = "Move line up", silent = true, noremap = true })
km.set("n", "<M-j>", ":MoveLine 1<CR>", { desc = "Move line down", silent = true, noremap = true })
km.set("v", "<M-k>", ":MoveBlock -1<CR>", { desc = "Move block up", silent = true, noremap = true })
km.set("v", "<M-j>", ":MoveBlock 1<CR>", { desc = "Move block down", silent = true, noremap = true })

-- toggle error/warning overview
km.set("n", "<leader>cd", "<CMD>TroubleToggle<CR>", { desc = "Toggle code diagnostics", silent = true })

-- toggleable terminal
km.set({ "n", "t" }, "<F12>", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal", silent = true, noremap = true })

-- quickfix navigation
km.set("n", "<leader>qq", "<CMD>QFToggle<CR>", { desc = "Toggle quickfix list" })
km.set("n", "<leader>qc", "<CMD>Cclear<CR>", { desc = "Clear quickfix list" })
km.set("n", "<leader>qj", "<CMD>QNext<CR>", { desc = "Goto next quickfix list entry" })
km.set("n", "<leader>qk", "<CMD>QPrev<CR>", { desc = "Goto previous quickfix list entry" })

-- search & replace
km.set("v", "<leader>r", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", { desc = "Replace selection" })
km.set("n", "<leader>rr", "<CMD>SearchReplaceSingleBufferOpen<CR>", { desc = "Search/replace menu" })
km.set("n", "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", { desc = "Replace current word" })
km.set("n", "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", { desc = "Replace current WORD" })

-- hunk actions (git changed chunks)
km.set("n", "[h", "<CMD>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
km.set("n", "]h", "<CMD>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
km.set("n", "<leader>hp", "<CMD>Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
km.set("n", "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
