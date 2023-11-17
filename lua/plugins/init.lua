return {
    {
        "mbbill/undotree",
        init = function ()
            vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
        end
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = "<leader>t",
            insert_mappings = false,
        },
        init = function ()
            vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },
    {
        "eandrju/cellular-automaton.nvim",
    },
    {
        "stevearc/aerial.nvim",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        enabled = false,
        "karb94/neoscroll.nvim",
        opts = {},
    },
    {
        "ahmedkhalf/project.nvim",
        main = "project_nvim",
        opts = { manual_mode = true },
        init = function ()
            require('telescope').load_extension('projects')
            vim.keymap.set("n", "<leader>fp", require'telescope'.extensions.projects.projects)
        end
    },
    "sindrets/diffview.nvim",
    {
        enabled = false,
        "mattn/emmet-vim",
        init = function ()
            vim.keymap.set("i", "<TAB>", "emmet#expandAbbrIntelligent('<TAB>')", { expr = true })
        end
    },
    "mg979/vim-visual-multi",
    {
        enabled = false,
        "gelguy/wilder.nvim",
        opts = { modes = {":"} },
        init = function ()
            local wilder = require("wilder")
            wilder.set_option("renderer", wilder.popupmenu_renderer({
                highlighter = wilder.basic_highlighter(),
                left = {' ', wilder.popupmenu_devicons()},
            }))
        end,
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
    "lewis6991/satellite.nvim",
    "rafcamlet/nvim-luapad",
}

