return {
    "rcarriga/nvim-notify",
    opts = {
        background_colour = "#000000",
    },
    init = function ()
        vim.notify = require("notify")
    end
}
