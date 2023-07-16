-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local my_group = vim.api.nvim_create_augroup('my_group', {clear = true})

vim.api.nvim_create_autocmd('FileType', {
    group = my_group,
    pattern = {'lua'},
    callback = function(event)
        -- set tab width to 4 spaces
        vim.bo[event.buf].shiftwidth = 2
        vim.bo[event.buf].tabstop = 2
        vim.bo[event.buf].softtabstop = 2
        vim.bo[event.buf].expandtab = true
        vim.wo.foldmethod = 'marker'
    end
})

local function augroup(name)
    return vim.api.nvim_create_augroup('lazyvim_' .. name, {clear = true})
end

-- vim.nvim_create_autocmd("BufEnter", {
--     group = my_group,
--     pattern = {"lua"},
--     callback = function()
--         vim.opt.termguicolors = true
--         require("ccc").setup({highlighter = {auto_enable = true}})
--     end
-- })

vim.api.nvim_create_autocmd('FileType', {
    group = augroup('close_with_q'),
    pattern = {'oil'},
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>',
                       {buffer = event.buf, silent = true})
    end
})
