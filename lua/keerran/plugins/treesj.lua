return {
    'refractalize/treesj',
    branch = "support-for-csharp",
    keys = { '<leader>sm', '<leader>sj', '<leader>ss' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = function()
        local lang_utils = require("treesj.langs.utils")
        local no_space_in_brackets = lang_utils.set_preset_for_list({
            join = {
                space_in_brackets = false,
            },
        })
        return {
            use_default_keymaps = false,
            max_join_length = 1000,
            langs = {
                gdscript = {
                    parameters = no_space_in_brackets,
                    array = no_space_in_brackets,
                }
            },
        }
    end,
    init = function()
        map_group('n', '<leader>s', 'Treesj')
        vim.keymap.set('n', '<leader>sm', require('treesj').toggle, { desc = "Toggle code block" })
        vim.keymap.set('n', '<leader>sj', require('treesj').join, { desc = "Join code block" })
        vim.keymap.set('n', '<leader>ss', require('treesj').split, { desc = "Split code block" })
    end
}
