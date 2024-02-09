-- import mason plugin
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    return
end

-- import mason-lspconfig plugin
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        -- "gopls",
        "lua_ls",
        -- "jedi_language_server",
        -- "terraformls",
        -- "dockerls",
        -- "bash-language-server",
        -- "yamlls",
        -- "rust_analyzer",
        -- "ansiblels",
        "azure_pipelines_ls",
        "powershell_es",
    },

})
