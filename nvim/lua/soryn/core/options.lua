-- line numbers with relative & absolute number on current line
vim.opt.number = true
vim.opt.relativenumber = true

-- scroll offset (make sure amount of lines are always around the cursor)
vim.opt.scrolloff = 8

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

-- clipboard (use OS clipboard)
vim.opt.clipboard:append("unnamedplus")

-- splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- consider "-" as part of the word
vim.opt.iskeyword:append("-")

-- update time for refreshing files
vim.opt.updatetime = 100

-- make sure string (``) is visible in .md
vim.opt.conceallevel = 0

-- don't show "-- INSERT --" in command bar
vim.opt.showmode = false
