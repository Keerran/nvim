-- highlight yanked text for 200ms using the "Cursor" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Cursor", timeout=100})
augroup END
]]
