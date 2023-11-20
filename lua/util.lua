local M = {}

function M.get_visual_selection()
    local start = vim.fn.getpos("'<")
    local finish = vim.fn.getpos("'>")
    local n_lines = math.abs(finish[2] - start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, start[2] - 1, finish[2], false)
    lines[1] = string.sub(lines[1], start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, finish[3] - start[3] + 1)
    else
        lines[n_lines] = string.sub(lines[n_lines], 1, finish[3])
    end
    return table.concat(lines, '\n')
end

function M.calculate_selection()
    local s_buf, s_row, s_col = unpack(vim.fn.getpos("'<"), 1, 3)
    local e_row, e_col = unpack(vim.fn.getpos("'>"), 2, 3)
    local selection = M.get_visual_selection()
    local result = tostring(vim.fn.eval(selection))
    ---@diagnostic disable-next-line: param-type-mismatch
    local row_length = vim.fn.getline(e_row):len()
    e_col = math.min(e_col, row_length)

    vim.api.nvim_buf_set_text(s_buf, s_row - 1, s_col - 1, e_row - 1, e_col, { })
    vim.api.nvim_buf_set_text(s_buf, s_row - 1, s_col - 1, s_row - 1, s_col - 1, { result })
end

return M

