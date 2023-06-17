local saga_ok, saga = pcall(require, "lspsaga")
if not saga_ok then
    return
end

saga.setup({
    scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    definition = {
        edit = "<CR>",
    },
})
