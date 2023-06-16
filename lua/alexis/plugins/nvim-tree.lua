local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end


-- disable netrw (disable before setup to avoid race conditions)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Highlights
vim.cmd[[highlight NvimTreeGitNew guifg=lightgreen]]
vim.cmd[[highlight NvimTreeGitStaged guifg=green]]
vim.cmd[[highlight NvimTreeGitMerge guifg=darkcyan]]

-- nvim_set_hl doesnt work
-- vim.api.nvim_set_hl(0, "NvimTreeGitNew", {guifg=darkcyan, ctermfg=darkcyan})
-- vim.api.nvim_set_hl(0, "NvimTreeGitStaged", {guifg=green, ctermfg=green})
-- vim.api.nvim_set_hl(0, "NvimTreeGitAdded", {guifg=lightgreen})
-- check highlights with 
-- :so $VIMRUNTIME/syntax/hitest.vim

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Mappings
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L1845
local function my_keymaps(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- defaults
    api.config.mappings.default_on_attach(bufnr)
    -- custom
    vim.keymap.set('n', 'l',    api.node.open.edit,                         opts('Open'))
    vim.keymap.set('n', 'h',    api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '-',    api.tree.close,                        opts('Close'))
    vim.keymap.set('n', '.',    api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'R',    api.fs.rename_sub,                     opts('Rename: Omit Filename'))
    vim.keymap.set('n', 'L',    api.tree.reload,                       opts('Refresh'))
    vim.keymap.set('n', '?',    api.tree.toggle_help,                  opts('Help'))

  end

configs = {
    -- sort_by = "case_sensitive",
    modified = {
        enable = true,
    },
    view = {
        width = 30,
    },
    git = {
        enable = true,
        ignore = false,
        show_on_open_dirs = false,
    },
    renderer = {
        add_trailing = true,
        group_empty = true,         -- compact single folder dirs to single node
        highlight_modified = "name",
        highlight_git = true,


        indent_markers = {
            enable = true,
            inline_arrows = false,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = "|",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = false,
                folder_arrow = true,
                git = false,
                modified = true,
            },
            glyphs = {
                modified = "[+]"
            }
        },
    },
    filters = {
        dotfiles = false,
  },
  on_attach = my_keymaps,
}


nvimtree.setup(configs)
