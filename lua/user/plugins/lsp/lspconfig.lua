local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp= pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
    return
end


local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
end


local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- language server aware of runtime files
               library = {
                   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                   [vim.fn.stdpath("config") .. "/lua"] = true,
               },
            },
        },
    },
})

lspconfig["azure_pipelines_ls"].setup{
  settings = {
      yaml = {
          schemas = {
              ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                  "/azure-pipeline*.y*l",
                  "/*.azure*",
                  "Azure-Pipelines/**/*.y*l",
                  "Pipelines/*.y*l",
                  "az*pipeline.y*l",
              },
          },
      },
  },
}

lspconfig["powershell_es"].setup{}

-- lspconfig["jedi_language_server"].setup{}
-- lspconfig["gopls"].setup{}
-- 
-- -- Terraform setup
-- lspconfig["terraformls"].setup{}
-- vim.api.nvim_create_autocmd({"BufWritePre"}, { pattern = {"*.tf", "*.tfvars"}, callback = vim.lsp.buf.format(), })
