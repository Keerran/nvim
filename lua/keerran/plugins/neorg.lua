return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts =  {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.summary"] = {},
            ["core.keybinds"] = {
                config = {
                    hook = function (keybinds)
                        keybinds.remap_key("norg", "n", "<C-Space>", "<localleader>tt")
                    end
                }
            },
            ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/notes",
                    },
                },
            },
        },
    },
    init = function ()
        vim.api.nvim_create_user_command(
            "Org",
            "Neorg",
            {}
        )
    end
}
