-- https://gist.github.com/emilienlemaire/99868fcd892dad56b5c776e0e0b1b159#file-utils-lua
local M = {}    -- module to export

local cmd = vim.cmd


function M.create_augroup(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end


_G.utils = M
return M    -- export module
