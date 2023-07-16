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
    if not keys.active[keys.parse({lhs, mode = mode}).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
-- }}}

-- {{{ My Keymaps
-- 🔥 Start a markdown code blocks
-- TODO: Only show up in Markdown files?
map({'n', 'v'}, '<leader>mcb', 'i```<Esc>', {desc = 'Markdown Code Block'})

-- 🔥 Start a lua fold block
-- TODO: Only show up in lua files?
map({'n', 'v'}, '<leader>mcf', 'i--<Space>{{{<CR><Esc>0dwo--<Space>}}}<Esc>k',
    {desc = 'Lua Fold Block'})
-- ☑️ taMkdown checkboxx
map({'n'}, '<leader>mcc', 'i-<Space>[<Space>]<Space>',
    {desc = 'Markdown Check Box'})

-- FIX: I need the box to come up when I press ;
map({'n', 'v'}, ';', ':<space>', {desc = 'alternative :'})

-- Replace next word
map({'n', 'v'}, '<Leader>mkr', '*``cgn',
    {desc = 'Replace Next Word', noremap = true})

-- flip through buffers with H and L
map('n', 'H', '<cmd>bprevious<CR>', {desc = 'Previous Buffer'})
map('n', 'L', '<cmd>bnext<CR>', {desc = 'Next Buffer'})

-- U and V to move up and down normal mode
map({'n', 'v'}, 'V', '15jzz', {desc = 'easily move down'})
map({'n', 'v'}, 'U', '15kzz', {desc = 'easily move up'})

-- TODO: I thibk I've got a plugin for this
map('v', 'J', ':m \'>+1<CR>gv=gv', {desc = 'move block down'})
map('v', 'K', ':m \'<-2<CR>gv=gv', {desc = 'move block up'})

-- TODO: I'm trying to do this wirh a plugin
-- map('n', 'J', 'mzJ`z', { desc = 'a better J' })

-- Center current line on screen vertically
map('n', '<C-d>', '<C-d>zz', {desc = 'center cursor for CTRL+D'})
map('n', '<C-u>', '<C-u>zz', {desc = 'center cursor for CTRL+U'})

--  TODO: I dont know what this does
map('n', 'n', 'nzzzv', {desc = 'a diff n'})

-- "greatest remap ever" - theprimeagen
-- vim.keymap.set("x", "<leader>p", [["_dP]])
map('x', '<leader>p', [["_dP]], {desc = 'paste and keep buffer'})

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- FIX: I dunno
-- map({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'hell nah!' })

-- CTRL-P pastes register in command mode
-- vim.api.nvim_set_keymap('c', '<C-p>', '<C-r>*', {noremap = true, silent = true})
map('c', '<C-p>', '<C-r>*',
    {desc = 'paste in command mode', noremap = true, silent = true})

map('n', '<Leader>msr', 'viw:lua require("spectre").open_file_search()<cr>',
    {desc = 'Spectre', noremap = true, silent = true})
-- Replace a selection
-- xnoremap <leader>j y<cmd>substitute(@", '/'), '(@", '/'), '\n', '\\n', 'g')<cr>"_cgn
map('n', '<C-l>',
    'y<cmd>substitute(escape(@\", \'/\'), \'\n\', \'\\n\', \'g\')<cr>',
    {desc = 'Replace a selection', noremap = true, silent = true})

-- }}}

wk.register({
    -- My Group Descriptions
    ['<leader>mn'] = {name = '+Noice'},
    ['<leader>mh'] = {name = '+Harpoon'},
    ['<leader>mt'] = {name = '+Telescope'},
    ['<leader>m'] = {
        name = '+My Maps',
        x = {'<cmd>!chmod +x %<CR>', 'chmod +x file', {silent = true}},
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
        f = {
            [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left><CR>]],
            'Search & Replace'
        },

        s = {'<cmd>source %<CR>', 'Source File'},
        w = {'<cmd>w<CR>', 'Save File'},
        m = {'<cmd>w<CR>', 'Save File'},
        -- n = {"<cmd>Noice<CR>", "Noice File"},
        ts = {
            ':lua require"treesitter-unit".select()<CR>',
            'Treesitter Unit Select'
        }

    }
})

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

-------------------------------------------------------
-- yank.sh                                           --
-- https://sunaku.github.io/tmux-yank-osc52.html     --
-------------------------------------------------------
vim.cmd([[
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
]])

-- add keymap for Yank
map({'n', 'v'}, '<Leader>my', 'y:<C-U>call Yank(@0)<CR>',
    {silent = true, desc = 'yank.sh'})
