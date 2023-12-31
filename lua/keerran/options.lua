vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

vim.opt.shellslash = true

-- allow mouse events
vim.opt.mousemoveevent = true

-- 24-bit colors
vim.opt.termguicolors = true

-- no line wrap
vim.opt.wrap = false

-- lin numbers
vim.opt.number = true

-- incremental search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- 4 width soft tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- ignore case in commands and searches
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- unix-style autocomplete
vim.opt.wildmode =  "longest,full"

-- maintain undo history between sessions
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- stop comment continuation on newline
vim.opt.formatoptions:remove("r")
