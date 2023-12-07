-- highlight yanked text for 200ms using the "Cursor" highlight group
vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({higroup="Cursor", timeout=100})
    end
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt.formatoptions:remove("r")
    end
})
