local opt = vim.opt

-- line numbers
opt.number = true         -- include line numbers
opt.relativenumber = true -- use relative line numbers (not absolute)
opt.cursorline = true     -- highlight the current cursor line

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- turn tabs into spaces

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search
opt.ignorecase = false
opt.smartcase = false

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.mouse = 'a'
