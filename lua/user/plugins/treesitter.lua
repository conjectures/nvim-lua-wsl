local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
    return
end

treesitter.setup({
    highlight = {
        enable = true
    },
    indent = { enable = true },
    autotag = { enable = true }, -- must have autotags set up already
    ensure_installed = {
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "python",
        "go",
        "terraform",
        "hcl",
        "make"
    },
    auto_install = true,

})
vim.treesitter.language.add('terraform', 'tfvars')
