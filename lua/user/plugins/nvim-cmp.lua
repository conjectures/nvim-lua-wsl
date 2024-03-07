
-- safe import
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

cmp.setup({
    snippet = {
        expand = function(args)
        luasnip.lsp_expand(args.body)
        end,
    },
    --
    -- view = {
    --     entries = {name = 'native' }
    -- },

    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
        ["<C-I>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}), -- ctrl+Tab
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        -- ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions       ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({
            reason = cmp.ContextReason.Auto,
        }), {"i", "c"}),

        ["<C-e>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

    }),
    sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp"},
        { name = "luasnip"},
        { name = "buffer" },
        { name = "path" },
    }),

    formatting = {
        format = function(entry, vim_item)
            -- use icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind] )
            -- source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lua = "[Lua]",
            })[entry.source.name]
            return vim_item
        end

    },
})


