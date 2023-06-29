local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_ok then
    return
end

autopairs.setup({
    check_ts = true,            -- enable treesitter
    ts_config = {
        lua = { "string" },     -- don't add pair on treesitter node

    },
})


-- import nvim-autopairs completion
local cmp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_ok then
    return
end

--import nvim-cmp plugin
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
    return
end

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())
