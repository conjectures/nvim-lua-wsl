


local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand




vim.w.clip = '/mnt/c/Windows/System32/clip.exe'
if vim.fn.executable(vim.w.clip) == 1 then

    augroup('WSLYank', { clear = true})
    autocmd('TextYankPost', {
        group = 'WSLYank',
        command = "if v:event.operator ==# 'y' | call system(w:clip, @0) | endif"
    })
end

-- 
-- augroup WSLYank
--     autocmd!
--     autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
-- augroup END
-- 
-- 
--  augroup lsp_document_format
--        autocmd! * <buffer>
--        autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
--  augroup END
-- 
--      vim.api.nvim_create_autocmd("BufWritePre", {
-- 		callback = function() vim.lsp.buf.format() end,
-- 		group = vim.api.nvim_create_augroup("lsp_document_format", {clear = true})
-- 	})
-- 
