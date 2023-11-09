vim.g.mapleader = "\\"

vim.opt.mousemoveevent = true

vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.number = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wildmode =  "longest,full"

-- highlight yanked text for 200ms using the "Cursor" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Cursor", timeout=100})
augroup END
]]
