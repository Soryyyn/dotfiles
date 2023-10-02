-- set global leader key to space
vim.g.mapleader = " "

-- normal mode
vim.keymap.set("n", "<leader>h", ':let @/=""<CR>')          -- remove all search highlights
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")                  -- save file
vim.keymap.set("n", "<C-h>", "<C-w>h")                      -- move to left window
vim.keymap.set("n", "<C-j>", "<C-w>j")                      -- move to down window
vim.keymap.set("n", "<C-k>", "<C-w>k")                      -- move to up window
vim.keymap.set("n", "<C-l>", "<C-w>l")                      -- move to right window
vim.keymap.set("n", "x", '"_x')                             -- don't copy char into register after deleting
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>") -- toggle file tree
