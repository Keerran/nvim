-- ctrl-bksp to delete previous word
vim.keymap.set({"i", "c"}, "<C-H>", "<C-W>")

-- paste without changing the register
vim.keymap.set("x", "p", "\"_dP")

-- copy and paste to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"*y", { desc = "Yank to clipboard" })
vim.keymap.set({"n", "v"}, "<leader>p", "\"*p", { desc = "Paste from clipboard" })

-- insert single character
vim.keymap.set("n", "<Space>", [[:exec "normal i".nr2char(getchar())."\e"<Cr>]], { desc = "Insert a single character", noremap = true, silent = true })

-- indenting and unindenting
if vim.g.vscode then
    vim.keymap.set("n", '<Tab>', '<Cmd>call VSCodeNotify("editor.action.indentLines")<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", '<S-Tab>', '<Cmd>call VSCodeNotify("editor.action.outdentLines")<CR>', { noremap = true, silent = true })
    vim.keymap.set("v", '<Tab>', '<Cmd>call VSCodeNotify("editor.action.indentLines")<CR>', { noremap = true, silent = true })
    vim.keymap.set("v", '<S-Tab>', '<Cmd>call VSCodeNotify("editor.action.outdentLines")<CR>', { noremap = true, silent = true })
else
    vim.keymap.set("n", "<TAB>", ">>")
    vim.keymap.set("n", "<S-TAB>", "<<")
    vim.keymap.set("v", "<TAB>", ">gv")
    vim.keymap.set("v", "<S-TAB>", "<gv")
end

-- user command for opening vim config folder
vim.api.nvim_create_user_command("Config", "execute 'tcd' fnamemodify($MYVIMRC, ':h')", {})

-- <C-s> to save in insert
vim.keymap.set("i", "<C-s>", "<ESC><CMD>w<CR>")

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

-- move lines in visual mode with <C-jk>
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = "Select all", noremap = true })

-- +/- to increment/decrement number
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number", noremap = true })

-- <C-Enter> to open new line below
vim.keymap.set("n", "<C-J>", "O<ESC>", { noremap = true })
vim.keymap.set("i", "<C-J>", "<CR><Up>", { noremap = true })

-- <ESC> to clear search
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR><ESC>", { noremap = true, silent = true })

-- <ESC> in terminal to go to normal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- <leader>! to calculate selection
vim.keymap.set("v", "<leader>!", [[:<C-u>lua require("keerran.util").calculate_selection()<CR>]])
