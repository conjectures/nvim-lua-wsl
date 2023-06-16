
local opt = vim.opt



-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")
-- Netrw
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_liststyle = 3 -- open in tree mode
--
-- split windows
--opt.splitright = true
--opt.splitbelow = true
--
--opt.iskeyword:append("-") -- make dash part of word
