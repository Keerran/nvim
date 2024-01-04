local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- highlight yanked text for 200ms using the "Cursor" highlight group
augroup('YankHighlight', { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({higroup="Cursor", timeout=100})
    end
})

autocmd("FileType", {
    callback = function()
        vim.opt.formatoptions:remove("r")
    end
})
