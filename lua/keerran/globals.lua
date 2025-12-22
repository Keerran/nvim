---@param mode string|string[]
---@param key string
---@param name string
function _G.map_group(mode, key, name)
    local ok, wk = pcall(require, "which-key")
    if ok then
        wk.add({{ key, mode = mode, group = name }})
    end
end
