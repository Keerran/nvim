return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag"
        },
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                },
                autotag = {
                    enable = true
                }
            }
        end
    },
    -- { "nvim-treesitter/nvim-treesitter-context" },
}
