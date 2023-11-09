return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            -- separator_style = "slant",
            -- hover = {
            --     enabled = true,
            --     reveal = {'close'}
            -- }
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    separator = true,
                }
            }
        },
    },
    config = true,
    init = function ()
        vim.keymap.set("n", "gb", ":BufferLinePick<CR>", { silent = true, noremap = true })
    end
}
