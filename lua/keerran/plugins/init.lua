return {
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        "DNLHC/glance.nvim",
        opts = {}
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            window = {
                blend = 0,
            }
        },
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
        init = function ()
            vim.notify = require("notify")
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = "<leader>t",
            insert_mappings = false,
        },
    },
    "mg979/vim-visual-multi",
    {
        "lewis6991/satellite.nvim",
        enabled = false,
        opts = {
            winblend = 0,
        }
    },
    "tpope/vim-abolish",
    {
        "3rd/image.nvim",
        opts = {
            backend = "kitty",
            processor = "magick_cli",
            neorg = {
              enabled = true,
              filetypes = { "norg" },
            },
        }
    },
}
