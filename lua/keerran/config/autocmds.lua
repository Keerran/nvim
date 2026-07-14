local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- highlight yanked text for 100ms using the "Cursor" highlight group
augroup('YankHighlight', { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({ higroup = "Cursor", timeout = 100 })
    end
})

-- don't automatically continue comments
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
            return function()
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

autocmd("FileType", {
    group = augroup("tree-sitter-enable", { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or not vim.treesitter.language.add(lang) then return end

        if vim.treesitter.query.get(lang, "highlights") then vim.treesitter.start(args.buf) end
    end,
})

autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function()
        vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, { silent = true })
        vim.keymap.set("n", "<S-F6>", vim.lsp.buf.rename)
        vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Open hover hint" })
        vim.keymap.set("n", "<leader>l", vim.lsp.buf.format, { desc = "Format file" })
        vim.keymap.set("n", "gH", vim.diagnostic.open_float, { desc = "Open diagnostic" })

        vim.api.nvim_set_hl(0, '@lsp.type.string', {})
    end
})
