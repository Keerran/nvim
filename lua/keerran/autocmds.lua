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

-- make i and a indent properly on empty lines
autocmd("FileType", {
    callback = function()
        if vim.bo.filetype == "" or vim.bo.filetype == "toggleterm" then
            return
        end
        local function smart_insert(key)
            return function ()
                ---@diagnostic disable-next-line: param-type-mismatch
                if vim.fn.getline(".") == "" then
                    return [["_cc]]
                else
                    return key
                end
            end
        end
        vim.keymap.set("n", "i", smart_insert("i"), { expr = true })
        vim.keymap.set("n", "a", smart_insert("a"), { expr = true })
    end
})
