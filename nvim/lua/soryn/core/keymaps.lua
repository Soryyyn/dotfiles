-- set global leader key to space
vim.g.mapleader = " "

-- normal mode
vim.keymap.set("n", "<leader>h", ':let @/=""<CR>', { desc = "Remove highlighting" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current file" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle filetree" })
vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previos buffer", silent = true })
vim.keymap.set("n", "<C-w>c", "<cmd>bd<CR>", { desc = "Close current buffer", silent = true })
vim.keymap.set("n", "<C-w>cf", "<cmd>bd!<CR>", { desc = "Close current buffer (force)", silent = true })
vim.keymap.set("n", "<C-w>p", "<cmd>BufferLinePick<CR>", { desc = "Pick from open buffers", silent = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Find git files" })
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
