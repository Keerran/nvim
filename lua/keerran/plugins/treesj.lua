return {
  'Wansmer/treesj',
  keys = { '<leader>sm', '<leader>sj', '<leader>ss' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
      use_default_keymaps = false
  },
  init = function ()
      map_group('n', '<leader>s', 'Treesj')
      vim.keymap.set('n', '<leader>sm', require('treesj').toggle, { desc = "Toggle code block" })
      vim.keymap.set('n', '<leader>sj', require('treesj').join, { desc = "Join code block" })
      vim.keymap.set('n', '<leader>ss', require('treesj').split, { desc = "Split code block" })
  end
}
