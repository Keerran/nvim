return {
    "famiu/bufdelete.nvim",
    init = function ()
        vim.keymap.set(
            "n",
            "<leader>d",
            function()
                require("bufdelete").bufdelete(0, false)
            end,
            { desc = "Delete buffer" }
        )
    end
}
