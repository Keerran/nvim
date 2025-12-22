-- ctrl-bksp to delete previous word
vim.keymap.set({"i", "c"}, "<C-H>", "<C-W>")

-- paste without changing the register
vim.keymap.set("x", "p", [["_dP]])

-- copy and paste to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["*y]], { desc = "Yank to clipboard" })
vim.keymap.set({"n", "v"}, "<leader>p", [["*p]], { desc = "Paste from clipboard" })

-- indent and unindent
vim.keymap.set("n", "<TAB>", ">>")
vim.keymap.set("n", "<S-TAB>", "<<")
vim.keymap.set("v", "<TAB>", ">gv")
vim.keymap.set("v", "<S-TAB>", "<gv")

-- <M-hjkl> for window manipulation
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")

-- <M-←↑→↓> for window size manipulation
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { silent = true })

-- <C-Enter> to open new line below
vim.keymap.set("n", "<C-J>", "O<ESC>", { noremap = true })
vim.keymap.set("i", "<C-J>", "<CR><Up>", { noremap = true })

-- <ESC> to clear search and notifications
local function clearDisplay()
    vim.cmd.nohlsearch()
    local ok, notify = pcall(require, "notify")
    if ok then
        notify.dismiss()
    end
end
vim.keymap.set("n", "<ESC>", clearDisplay, { noremap = true, silent = true })

-- <ESC> in terminal to go to normal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- user command for opening vim config folder
vim.api.nvim_create_user_command("Config", "execute 'tcd' fnamemodify($MYVIMRC, ':h')", {})

-- execute selection (is this unsafe??)
vim.keymap.set("v", "<leader>!", [[:<C-u>lua require("keerran.utils").calculate_selection()<CR>]])
