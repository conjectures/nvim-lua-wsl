

local colorscheme = "kanagawa"

require('kanagawa').setup({
    transparent = true,
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }           
    }
})


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return 
end

-- vim.cmd("colorscheme kanagawa")
