---@param mode string|string[]
---@param key string
---@param name string
function _G.map_group(mode, key, name)
    local ok, wk = pcall(require, "which-key")
    if ok then
        wk.register({
            [key] = {
                name = name
            }
        }, { mode = mode })
    end
end
