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
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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


    -- popups
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- colorscheme
    use("rebelot/kanagawa.nvim")
    -- icons
    use("kyazdani42/nvim-web-devicons")
    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- formatting 
    use("tpope/vim-surround")
    
    -- lsp
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



    -- git


    if packer_bootstrap then
        require("packer").sync()
    end
end)
