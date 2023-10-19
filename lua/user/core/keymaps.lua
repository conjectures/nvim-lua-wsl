

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap


vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal -- 
-- Buffer navigation
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
keymap("n", "<leader>bl", ":buffers<CR>", opts)

-- Explorer
keymap("n", "<leader>e", ":Explore<CR>", opts)
keymap("n", "-", ":Lexplore<CR>", opts)
-- keymap('n', '-', ':Lexplore<CR>', { remap = true, 'buffer': v:true })

-- Window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- QOL 
keymap("n", "x", '"_x', opts) -- don't replace keymap with character delete

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Nerd-tree
keymap("n", "-", ":NvimTreeToggle<CR>", opts)
-- OpenBrowser
keymap("n", "gx", '<Plug>(openbrowser-smart-search)', { silent = true})
keymap("v", "gx", '<Plug>(openbrowser-smart-search)', { silent = true})
keymap("v", "gs", '<Plug>(openbrowser-search)', { silent = true})

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- keymap("n", "<leader>fd", "<cmd>Telescope diff diff_current<CR>", opts)
keymap("n", "<leader>fdc", ":lua require('telescope').extensions.diff.diff_current({hidden=true})<CR>", opts)
keymap("n", "<leader>fdf", ":lua require('telescope').extensions.diff.diff_files({hidden=true})<CR>", opts)
-- keymap("n", "<leader>fd", "<cmd>Telescope help_tags<CR>", opts)


-- netrw generates too many empty buffers
-- -- Netrw mappings
-- -- https://gist.github.com/VonHeikemen/b703ca1b6ce039977e239704bf5e2941
-- local function netrw_mapping()
--   local bufmap = function(lhs, rhs)
--     local opts = {buffer = true, remap = true}
--     vim.keymap.set('n', lhs, rhs, opts)
--   end
-- 
--   -- Better navigation
--   bufmap('H', 'u')
--   bufmap('h', '-^')
--   bufmap('l', '<CR>')
--   bufmap('L', '<CR><C-h>:q<CR>')
--   bufmap('<C-l>', '<C-w>l')         -- move to right pane
--   bufmap('-', ':q<CR>')             -- close window 
-- 
--   -- Toggle dotfiles
--   bufmap('.', 'gh')
-- end
-- 
-- local user_cmds = vim.api.nvim_create_augroup('user_cmds', {clear = true})
-- vim.api.nvim_create_autocmd('filetype', {
--     pattern = 'netrw',
--     group = user_cmds,
--     desc = 'Keybindings for netrw',
--     callback = netrw_mapping
-- })


