local cs = "nightfly"

-- set colorscheme with protected call in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme" .. ' ' .. cs)
if not status then
    vim.api.nvim_echo({
        { "Colorscheme " .. cs .. " not found!", "ErrorMsg" },
    }, true, {})
    return
end
