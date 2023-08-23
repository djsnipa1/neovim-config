-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local my_group = vim.api.nvim_create_augroup('my_group', { clear = true })

-- vim.api.nvim_create_autocmd('FileType', {
--   group = my_group,
--   pattern = { 'lua' },
--   callback = function(event)
--     -- set tab width to 2 spaces
--     vim.bo[event.buf].shiftwidth = 2
--     vim.bo[event.buf].tabstop = 2
--     vim.bo[event.buf].softtabstop = 2
--     vim.bo[event.buf].expandtab = true
--     vim.wo.foldmethod = 'marker'
--   end
-- })

vim.cmd [[
augroup filetype_settings
  autocmd!

  " JavaScript settings
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab foldmethod=marker

  " TypeScript settings
  autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab foldmethod=marker

  " Markdown settings
  autocmd FileType markdown setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab foldmethod=marker

  " Lua settings
  autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab foldmethod=marker

  " Python settings
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab foldmethod=marker

  " Shell settings
  autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab foldmethod=marker

  " Nix settings
  autocmd FileType nix setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab foldmethod=marker
augroup END
]]

local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
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
  pattern = { 'oil' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>',
      { buffer = event.buf, silent = true })
  end
})
