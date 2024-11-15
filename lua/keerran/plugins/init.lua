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
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
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
        "nvim-telescope/telescope-project.nvim",
        init = function ()
            require('telescope').load_extension('project')
            vim.keymap.set(
                "n",
                "<leader>fp",
                require'telescope'.extensions.project.project,
                { desc = "Find Project" }
            )
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
        "lewis6991/satellite.nvim",
        opts = {
            winblend = 0,
        }
    },
    "rafcamlet/nvim-luapad",
    {
        "tiagovla/scope.nvim",
        opts = {},
    },
}

