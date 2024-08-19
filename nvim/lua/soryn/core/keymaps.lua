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

-- telescope bindings
km.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find files in cwd" })
km.set("n", "<leader>fs", "<CMD>Telescope live_grep_args<CR>", { desc = "Find string in cwd" })
km.set("n", "<leader>fw", "<CMD>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
km.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Find open buffers" })
km.set("n", "<leader>fp", "<CMD>Telescope pickers<CR>", { desc = "Find previous pickers" })

-- open file tree/explorer
km.set("n", "<leader>ft", "<CMD>Neotree toggle<CR>", { desc = "Toggle filetree" })
km.set("n", "<leader>fe", "<CMD>Oil<CR>", { desc = "Toggle file explorer", silent = true, noremap = true })

-- lazygit
km.set("n", "<leader>g", "<CMD>LazyGit<CR>", { desc = "Open LazyGit" })

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

-- diagnostics
km.set("n", "<leader>dd", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Toggle code diagnostics", silent = true })
km.set(
    "n",
    "<leader>db",
    "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
    { desc = "Toggle code diagnostics (curr buffer)", silent = true }
)

-- toggleable terminal
km.set({ "n", "t" }, "<F12>", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal", silent = true, noremap = true })
km.set("t", "<F8>", "<C-\\><C-n>", { desc = "Exit terminal (insert) mode inside terminal" })

-- quickfix navigation
km.set("n", "<leader>q", function()
    require("quicker").toggle()
end, { desc = "Toggle quickfix" })

-- search & replace
km.set("v", "<leader>r", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", { desc = "Replace selection" })
km.set("n", "<leader>rr", "<CMD>SearchReplaceSingleBufferOpen<CR>", { desc = "Search/replace menu" })
km.set("n", "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", { desc = "Replace current word" })
km.set("n", "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", { desc = "Replace current WORD" })

-- window splitting
km.set("n", "<leader>w|", "<C-w>v", { desc = "Vertically split window" })
km.set("n", "<leader>w-", "<C-w>s", { desc = "Horizontally split window" })

-- swap windows
km.set("n", "<leader>wx", "<C-w>x", { desc = "Swap windows" })

-- windows sizing
km.set("n", "<leader>we", "<C-w>=", { desc = "Equally size windows" })
km.set("n", "<leader>ww", "<C-w>|", { desc = "Max out window width" })
km.set("n", "<leader>wh", "<C-w>_", { desc = "Max out window height" })
