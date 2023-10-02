-- line numbers with relative & absolute number on current line
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- color settings
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- consider "-" as part of the word
vim.opt.iskeyword:append("-")

-- update time for refreshing files
vim.opt.updatetime = 100
