

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap


vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal -- 
-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
keymap("n", "<leader>bl", ":buffers<CR>", opts)

-- Explorer
keymap("n", "<leader>e", ":Explore<CR>", opts)
keymap("n", "-", ":Lexplore<CR>", opts)
-- keymap('n', '-', ':Lexplore<CR>', { remap = true, 'buffer': v:true })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- QOL 
keymap("n", "x", '"_x', opts) -- don't replace keymap with character delete

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Netrw mappings
-- https://gist.github.com/VonHeikemen/b703ca1b6ce039977e239704bf5e2941
local function netrw_mapping()
  local bufmap = function(lhs, rhs)
    local opts = {buffer = true, remap = true}
    vim.keymap.set('n', lhs, rhs, opts)
  end

  -- close window
  bufmap('-', ':Lexplore<CR>')

  -- Better navigation
  bufmap('H', 'u')
  bufmap('h', '-^')
  bufmap('l', '<CR>')
  bufmap('L', '<CR>:Lexplore<CR>')

  -- Toggle dotfiles
  bufmap('.', 'gh')
end

local user_cmds = vim.api.nvim_create_augroup('user_cmds', {clear = true})
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    group = user_cmds,
    desc = 'Keybindings for netrw',
    callback = netrw_mapping
})


