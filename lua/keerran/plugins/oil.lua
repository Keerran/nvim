return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        map_group('n', '<leader>e', 'Oil')
        vim.keymap.set('n', '<leader>ee', "<CMD>e .<CR>", { desc = "Open current directory" })
        vim.keymap.set('n', '<leader>ef', "<CMD>e %:p:h<CR>", { desc = "Open buffer file directory" })
    end
}
