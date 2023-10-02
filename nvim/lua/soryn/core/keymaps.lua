-- set global leader key to space
vim.g.mapleader = " "

-- normal mode
vim.keymap.set("n", "<leader>h", ':let @/=""<CR>', { desc = "Remove highlighting" }) -- remove all search highlights
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current file" }) -- save file
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" }) -- move to left window
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" }) -- move to down window
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" }) -- move to up window
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" }) -- move to right window
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle filetree" }) -- toggle file tree
