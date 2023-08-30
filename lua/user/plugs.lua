-- Automatically install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true -- install packer and return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if just installed


-- Autocommand to reload neovim when plugins.lua file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Protectred call to avoid error on first use
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

-- Popup window for packer
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
    -- Add plugins here
    use("wbthomason/packer.nvim")        -- Have packer manage itself

    -- utils
    use("nvim-lua/plenary.nvim")

    -- popups
    use("nvim-lua/popup.nvim")

    -- colorscheme
    use("rebelot/kanagawa.nvim")
    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    use("tyru/open-browser.vim")
    use("tyru/open-browser-github.vim")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- formatting 
    use("tpope/vim-surround")

    -- completion
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths
    --
    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- fuzzy finder
    use({ "nvim-telescope/telescope.nvim", tag = '0.1.1', requires = { {"nvim-lua/plenary.nvim"}} })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use({ "jemag/telescope-diff.nvim", requires = { { "nvim-telescope/telescope.nvim"}}})

    -- lsp
    use({"williamboman/mason.nvim", build = ":MasonUpdate"})-- manage lsp servers
    use("williamboman/mason-lspconfig.nvim")                -- lspconfig interface for mason 
    use("neovim/nvim-lspconfig")                            -- lsp
    use("hrsh7th/cmp-nvim-lsp")                             -- lspconfig interface for cmp autocompletion
    use({"glepnir/lspsaga.nvim", branch = "main"})

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    -- auto pairs
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    })

    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
    use("sindrets/diffview.nvim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)

