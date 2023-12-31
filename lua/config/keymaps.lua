-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here --
--
-- {{{ LazyVim keymap bootstrap
local Util = require('lazyvim.util')
local wk = require('which-key')

local function map(mode, lhs, rhs, opts)
  local keys = require('lazy.core.handler').handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- }}}

-- {{{ My Keymapsap

-- Yank entire buffer
map('n', '<Leader>y', '<cmd>%y+', { desc = 'Yank entire buffer' })

-- Delete span tags
map(
  { 'n' }, '<Leader>mcs',
  ':%s/<span class=\\"[^\\"]*\\">\\([^<]*\\)<\\/span>/\\1/g<CR>',
  { desc = 'Delete <span> tags' }
)

-- 🔥 Start a markdown code blocks
-- TODO: Only show up in Markdown files?
map({ 'n', 'v' }, '<Leader>mcb', 'i```<Esc>', { desc = 'Markdown Code Block' })

-- 🔥 Start a lua fold block
-- TODO: Only show up in lua files?
map(
  { 'n', 'v' }, '<leader>mcf', 'i--<Space>{{{<CR><Esc>0dwo--<Space>}}}<Esc>k',
  { desc = 'Lua Fold Block' }
)
-- ☑️ taMkdown checkboxx
map(
  { 'n' }, '<leader>mcc', 'i-<Space>[<Space>]<Space>',
  { desc = 'Markdown Check Box' }
)

-- FIX: I need the box to come up when I press ;
map({ 'n', 'v' }, ';', ':<space>', { desc = 'alternative :' })

-- Replace next word
map(
  { 'n', 'v' }, '<Leader>mkr', '*``cgn',
  { desc = 'Replace Next Word', noremap = true }
)

-- flip through buffers with H and L
map('n', 'H', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })
map('n', 'L', '<cmd>bnext<CR>', { desc = 'Next Buffer' })

-- U and V to move up and down normal mode
map({ 'n', 'v' }, 'V', '15jzz', { desc = 'easily move down' })
map({ 'n', 'v' }, 'U', '15kzz', { desc = 'easily move up' })

-- TODO: I thibk I've got a plugin for this
map('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'move block down' })
map('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'move block up' })

-- TODO: I'm trying to do this wirh a plugin
-- map('n', 'J', 'mzJ`z', { desc = 'a better J' })

-- FIX:
-- Center current line on screen vertically
-- trying to do it with neoscroll
-- map(
--   'n', '<C-d>', '<C-d>zz',
--     { desc = 'center cursor for CTRL+D' }
-- )
-- map(
--   'n', '<C-u>', '<C-u>zz',
--     { desc = 'center cursor for CTRL+U' }
-- )

--  TODO: I dont know what this does
map('n', 'n', 'nzzzv', { desc = 'a diff n' })

-- "greatest remap ever" - theprimeagen
-- vim.keymap.set("x", "<leader>p", [["_dP]])
map('x', '<leader>p', [["_dP]], { desc = 'paste and keep buffer' })

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- FIX: I dunno
-- map({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'hell nah!' })

-- CTRL-P pastes register in command mode
-- vim.api.nvim_set_keymap('c', '<C-p>', '<C-r>*', {noremap = true, silent = true})
map(
  'c', '<C-p>', '<C-r>*',
  { desc = 'paste in command mode', noremap = true, silent = true }
)

map(
  'n', '<Leader>msr', 'viw:lua require("spectre").open_file_search()<cr>',
  { desc = 'Spectre', noremap = true, silent = true }
)
-- Replace a selection
-- xnoremap <leader>j y<cmd>substitute(@", '/'), '(@", '/'), '\n', '\\n', 'g')<cr>"_cgn
map(
  'n', '<C-l>',
  'y<cmd>substitute(escape(@\", \'/\'), \'\n\', \'\\n\', \'g\')<cr>',
  { desc = 'Replace a selection', noremap = true, silent = true }
)

-- }}}
function _G.search_and_replace()
  local current_word = vim.fn.expand("<cword>")
  local replacement_word = vim.fn.input("Enter replacement word: ")

  vim.cmd("%s/\\<" .. current_word .. "\\>/" .. replacement_word .. "/gI")

  -- Use your keymap plugin to map a key sequence to this function, like so:
  -- map('n', '<leader>sr', '<cmd>lua _G.search_and_replace()<CR>')
end

wk.register(
  {
    -- My Group Descriptions
    ['<leader>mn'] = { name = '+Noice' },
    ['<leader>mh'] = { name = '+Harpoon' },
    ['<leader>mt'] = { name = '+Telescope' },
    ['<leader><leader>'] = { name = '+My Maps' },
    ['<leader>m'] = {
      name = '+My Keymaps',
      x = { '<cmd>!chmod +x %<CR>', 'chmod +x file', { silent = true } },
      -- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

      -- :below
      -- next greatest remap ever : asbjornHaland
      -- see below :below
      -- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
      -- vim.keymap.set("n", "<leader>Y", [["+Y]])
      -- map({ "n", "v" }, "<leader>y", [["+y]], {  desc = "Lower case Y"  })
      -- map("n", "<leader>Y", [["+Y]], { desc = "Capital Y" })
      --
      -- map({ "n", "v" }, "<leader>y", [["+y]], { expr = true, silent = true })
      -- map("n", "<leader>Y", [["+Y]], { expr = true, silent = true })
      -- y = { [["+y]], "Capital Y"  },
      -- Y = { [["+Y]], "Lower case y"  },

      -- f = {
      --   [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left><CR>]],
      --   'Search & Replace'
      -- },
      f = { '<cmd>lua _G.search_and_replace()<CR>', 'Find & Replace' },
      -- map('n', '<leader>sr', '<cmd>lua _G.search_and_replace()<CR>')

      s = { '<cmd>source %<CR>', 'Source File' },
      w = { '<cmd>w<CR>', 'Save File' },
      m = { '<cmd>w<CR>', 'Save File' },
      -- n = {"<cmd>Noice<CR>", "Noice File"},
      ts = {
        ':lua require"treesitter-unit".select()<CR>',
        'Treesitter Unit Select'
      }

    }
  }
)

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

-------------------------------------------------------
-- yank.sh                                           --
-- https://sunaku.github.io/tmux-yank-osc52.html     --
-------------------------------------------------------
vim.cmd(
  [[
  " copy to attached terminal using the yank(1) script:
  function! Yank(text) abort
    " bash
    " let tty = system('readlink /proc/$$/fd/2')
    " fish
    let tty = system('readlink /proc/$fish_pid/fd/2')
    let escape = system('/home/chad/working/scripts/yank.sh', a:text)
    if v:shell_error
      echoerr escape
    else
      call writefile([escape], tty, 'b')
    endif
  endfunction

  " noremap <silent> <Leader>my y:<C-U>call Yank(@0)<CR>

  " automatically run yank(1) whenever yanking in Vim
  " function! CopyYank() abort
  "   call Yank(join(v:event.regcontents, "\n"))
  " endfunction
  " autocmd TextYankPost * call CopyYank()
]]
)

-- add keymap for Yank
map(
  { 'n', 'v' }, '<Leader>my', 'y:<C-U>call Yank(@0)<CR>',
  { silent = true, desc = 'yank.sh' }
)

if true then return {} end

-- {{{ lazyvim default keymaps for reference
-- LuaFormatter off
-- This file is automatically loaded by lazyvim.config.init
local Util = require('lazyvim.util')

local function map(mode, lhs, rhs, opts)
  local keys = require('lazy.core.handler').handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then opts.remap = nil end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map(
  { 'n', 'x' }, 'j', 'v:count == 0 ? \'gj\' : \'j\'',
  { expr = true, silent = true }
)
map(
  { 'n', 'x' }, 'k', 'v:count == 0 ? \'gk\' : \'k\'',
  { expr = true, silent = true }
)

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map(
  'n', '<C-Left>', '<cmd>vertical resize -2<cr>',
  { desc = 'Decrease window width' }
)
map(
  'n', '<C-Right>', '<cmd>vertical resize +2<cr>',
  { desc = 'Increase window width' }
)

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ':m \'>+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-k>', ':m \'<-2<cr>gv=gv', { desc = 'Move up' })

-- buffers
if Util.has('bufferline.nvim') then
  map('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
  map('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
  map('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
  map('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
else
  map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
  map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
  map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
  map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
end
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })

-- Clear search with <esc>
map(
  { 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>',
  { desc = 'Escape and clear hlsearch' }
)

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  'n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Redraw / clear hlsearch / diff update' }
)

map({ 'n', 'x' }, 'gw', '*N', { desc = 'Search word under cursor' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map(
  'n', 'n', '\'Nn\'[v:searchforward]',
  { expr = true, desc = 'Next search result' }
)
map(
  'x', 'n', '\'Nn\'[v:searchforward]',
  { expr = true, desc = 'Next search result' }
)
map(
  'o', 'n', '\'Nn\'[v:searchforward]',
  { expr = true, desc = 'Next search result' }
)
map(
  'n', 'N', '\'nN\'[v:searchforward]',
  { expr = true, desc = 'Prev search result' }
)
map(
  'x', 'N', '\'nN\'[v:searchforward]',
  { expr = true, desc = 'Prev search result' }
)
map(
  'o', 'N', '\'nN\'[v:searchforward]',
  { expr = true, desc = 'Prev search result' }
)

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- keywordprg
map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
map('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

if not Util.has('trouble.nvim') then
  map('n', '[q', vim.cmd.cprev, { desc = 'Previous quickfix' })
  map('n', ']q', vim.cmd.cnext, { desc = 'Next quickfix' })
end

-- stylua: ignore start

-- toggle options
map(
  'n', '<leader>uf', require('lazyvim.plugins.lsp.format').toggle,
  { desc = 'Toggle format on Save' }
)
map(
  'n', '<leader>us', function() Util.toggle('spell') end,
  { desc = 'Toggle Spelling' }
)
map(
  'n', '<leader>uw', function() Util.toggle('wrap') end,
  { desc = 'Toggle Word Wrap' }
)
map(
  'n', '<leader>ul', function()
    Util.toggle('relativenumber', true)
    Util.toggle('number')
  end, { desc = 'Toggle Line Numbers' }
)
map('n', '<leader>ud', Util.toggle_diagnostics, { desc = 'Toggle Diagnostics' })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map(
  'n', '<leader>uc',
  function() Util.toggle('conceallevel', false, { 0, conceallevel }) end,
  { desc = 'Toggle Conceal' }
)
if vim.lsp.inlay_hint then
  map(
    'n', '<leader>uh', function() vim.lsp.inlay_hint(0, nil) end,
    { desc = 'Toggle Inlay Hints' }
  )
end

-- lazygit
map(
  'n', '<leader>gg', function()
    Util.float_term(
      { 'lazygit' },
      { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }
    )
  end, { desc = 'Lazygit (root dir)' }
)
map(
  'n', '<leader>gG', function()
    Util.float_term({ 'lazygit' }, { esc_esc = false, ctrl_hjkl = false })
  end, { desc = 'Lazygit (cwd)' }
)

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- highlights under cursor
if vim.fn.has('nvim-0.9.0') == 1 then
  map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
end

-- LazyVim Changelog
map('n', '<leader>L', Util.changelog, { desc = 'LazyVim Changelog' })

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
map('n', '<leader>ft', lazyterm, { desc = 'Terminal (root dir)' })
map(
  'n', '<leader>fT', function() Util.float_term() end,
  { desc = 'Terminal (cwd)' }
)
map('n', '<c-/>', lazyterm, { desc = 'Terminal (root dir)' })
map('n', '<c-_>', lazyterm, { desc = 'which_key_ignore' })

-- Terminal Mappings
map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter Normal Mode' })
map('t', '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Go to left window' })
map('t', '<C-j>', '<cmd>wincmd j<cr>', { desc = 'Go to lower window' })
map('t', '<C-k>', '<cmd>wincmd k<cr>', { desc = 'Go to upper window' })
map('t', '<C-l>', '<cmd>wincmd l<cr>', { desc = 'Go to right window' })
map('t', '<C-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })
map('t', '<c-_>', '<cmd>close<cr>', { desc = 'which_key_ignore' })

-- windows
map('n', '<leader>ww', '<C-W>p', { desc = 'Other window', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window', remap = true })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })
map('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })

-- tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
-- }}}
