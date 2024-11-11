return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require 'telescope'
        local actions = require 'telescope.actions'

        -- https://github.com/MagicDuck/grug-far.nvim/pull/305
        local is_windows = vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1
        local vimfnameescape = vim.fn.fnameescape
        local winfnameescape = function(path)
          local escaped_path = vimfnameescape(path)
          if is_windows then
            local need_extra_esc = path:find('[%[%]`%$~]')
            local esc = need_extra_esc and '\\\\' or '\\'
            escaped_path = escaped_path:gsub('\\[%(%)%^&;]', esc .. '%1')
            if need_extra_esc then
              escaped_path = escaped_path:gsub("\\\\['` ]", '\\%1')
            end
          end
          return escaped_path
        end

        local select_default = function(prompt_bufnr)
          vim.fn.fnameescape = winfnameescape
          local result = actions.select_default(prompt_bufnr, "default")
          vim.fn.fnameescape = vimfnameescape
          return result
        end
        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ['<cr>'] = select_default,
                    },
                    n = {
                        ['<cr>'] = select_default,
                    }
                }
            }
        }
    end,
    init = function ()
        local builtin = require("telescope.builtin")
        map_group("n", "<leader>f", "Telescope")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    end
}
