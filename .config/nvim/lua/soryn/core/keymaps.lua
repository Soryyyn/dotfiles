local km = vim.keymap

-- set global leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better highlight clearing (escape and clear)
km.set({ "i", "n" }, "<esc>", "<CMD>noh<CR><esc>", { desc = "Exit mode and clear highlight" })

-- better half page scrolling (now with centering)
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")

-- paste selected text without yanking the replaced text
km.set({ "v", "n" }, "<leader>p", '"_dP', { desc = "Paste text without yanking selected" })

-- change undo bindings to all be on one key
km.set("n", "<S-u>", "<C-r>", { desc = "Redo" })

-- easier window navigation
km.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
km.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
km.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
km.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- telescope bindings
km.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find files in cwd" })
km.set("n", "<leader>fw", "<CMD>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
km.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Find open buffers" })
km.set("n", "<leader>fp", "<CMD>Telescope pickers<CR>", { desc = "Find previous pickers" })

-- open file tree/explorer
km.set("n", "<leader>ft", "<CMD>Neotree toggle<CR>", { desc = "Toggle filetree" })
km.set("n", "<leader>fe", "<CMD>Oil<CR>", { desc = "Toggle file explorer", silent = true, noremap = true })

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

-- window splitting
km.set("n", "<leader>ws", "<C-w>v", { desc = "Vertically split window" })
km.set("n", "<leader>wS", "<C-w>s", { desc = "Horizontally split window" })

-- swap windows
km.set("n", "<leader>wx", "<C-w>x", { desc = "Swap windows" })

-- windows sizing
km.set("n", "<leader>we", "<C-w>=", { desc = "Equally size windows" })
km.set("n", "<leader>ww", "<C-w>|", { desc = "Max out window width" })
km.set("n", "<leader>wh", "<C-w>_", { desc = "Max out window height" })

-- Show git blame for current line
km.set("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>", { desc = "Blame line" })

-- search & replace
km.set("n", "<leader>fs", "<CMD>lua require('grug-far').open({ transient = true })<CR>", { desc = "Search" })
km.set("n", "<leader>fS",
    "<CMD>lua require('grug-far').open({ transient = true, prefills = { paths = vim.fn.expand('%') } })<CR>",
    { desc = "Search in current file" })
km.set("v", "<leader>fs", "<CMD>lua require('grug-far').with_visual_selection({ transient = true })<CR>",
    { desc = "Search selection" })
km.set("v", "<leader>fS",
    "<CMD>lua require('grug-far').with_visual_selection({ transient = true, prefills = { paths = vim.fn.expand('%') } })<CR>",
    { desc = "Search selection in current file" })
