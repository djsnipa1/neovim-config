-- local api = require("nvim-tree.api")
--
-- local hint = [[
--  _w_: cd CWD   _c_: Copy File Path      _/_: Filter
--  _y_: Copy     _x_: Cut                 _p_: Paste
--  _r_: Rename   _d_: Remove              _n_: New
--  _h_: Hidden   _?_: Help
--  ^
-- ]]
-- -- ^ ^           _q_: exit
--
-- local nvim_tree_hydra = nil
-- local nt_au_group = vim.api.nvim_create_augroup("NvimTreeHydraAU", { clear = true })
--
-- local function close_nvim_tree_hydra()
--   if nvim_tree_hydra then
--     nvim_tree_hydra:exit()
--   end
-- end
--
-- Hydra.spawn = function(head)
--   if head == "nvim_tree_hydra" then
--     nvim_tree_hydra = Hydra({
--       name = "NvimTree",
--       hint = hint,
--       config = {
--         color = "pink",
--         invoke_on_body = true,
--         buffer = 0,  -- only for active buffer
--         hint = {
--           position = "bottom",
--           border = "rounded",
--         },
--       },
--       mode = "n",
--       body = "H",
--       heads = {
--         { "w", change_root_to_global_cwd, { silent = true } },
--         { "c", api.fs.copy.absolute_path, { silent = true } },
--         { "/", api.live_filter.start, { silent = true } },
--         { "y", api.fs.copy.node, { silent = true } },
--         { "x", api.fs.cut, { exit = true, silent = true } },
--         { "p", api.fs.paste, { exit = true, silent = true } },
--         { "r", api.fs.rename, { silent = true } },
--         { "d", api.fs.remove, { silent = true } },
--         { "n", api.fs.create, { silent = true } },
--         { "h", api.tree.toggle_hidden_filter, { silent = true } },
--         { "?", api.tree.toggle_help, { silent = true } },
--         -- { "q", nil, { exit = true, nowait = true } },
--       },
--     })
--
--     nvim_tree_hydra:activate()
--
--   end
-- end
--
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- 	pattern = "*" ,
-- 	callback = function(opts)
--         if vim.bo[opts.buf].filetype == "NvimTree" then
--           Hydra.spawn["nvim_tree_hydra"]()
--         else
--           close_nvim_tree_hydra() -- does not unload the keys - but hiding hydra ok...
--         end    
--     group = nt_au_group,
-- })
return {
  {
    'anuvyklack/hydra.nvim',
    config = function()
      local Hydra = require('hydra')

      Hydra(
        {
          name = 'Side scroll',
          mode = 'n',
          body = 'z',
          heads = {
            { 'h', '5zh' },
            { 'l', '5zl', { desc = '←/→' } },
            { 'H', 'zH' },
            { 'L', 'zL', { desc = 'half screen ←/→' } }
          }
        }
      )

      -- local Hydra = require('hydra')
      local cmd = require('hydra.keymap-util').cmd
      -- LuaFormatter off
      local hint = [[
                 _f_: files       _m_: marks
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
  🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
  🭅█ ▁     █🭐
  ██🬿      🭊██   _r_: resume      _u_: undotree
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _h_: vim help    _c_: execute command
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps     _;_: commands history 
                 _O_: options     _?_: search history
 ^
                 _<Enter>_: Telescope           _<Esc>_
]]
      Hydra(
        {
          name = 'Telescope',
          hint = hint,
          config = {
            color = 'teal',
            invoke_on_body = true,
            hint = { position = 'middle', border = 'rounded' }
          },
          mode = 'n',
          body = '<Leader>i',
          heads = {
            { 'f', cmd 'Telescope find_files' },
            { 'g', cmd 'Telescope live_grep' },
            {
              'o',
              cmd 'Telescope oldfiles',
              { desc = 'recently opened files' }
            },
            {
              'h',
              cmd 'Telescope help_tags',
              { desc = 'vim help' }
            },
            { 'm', cmd 'MarksListBuf', { desc = 'marks' } },
            { 'k', cmd 'Telescope keymaps' },
            { 'O', cmd 'Telescope vim_options' },
            { 'r', cmd 'Telescope resume' },
            {
              'p',
              cmd 'Telescope projects',
              { desc = 'projects' }
            },
            {
              '/',
              cmd 'Telescope current_buffer_fuzzy_find',
              { desc = 'search in file' }
            },
            {
              '?',
              cmd 'Telescope search_history',
              { desc = 'search history' }
            },
            {
              ';',
              cmd 'Telescope command_history',
              { desc = 'command-line history' }
            },
            {
              'c',
              cmd 'Telescope commands',
              { desc = 'execute command' }
            },
            {
              'u',
              cmd 'silent! %foldopen! | UndotreeToggle',
              { desc = 'undotree' }
            },
            {
              '<Enter>',
              cmd 'Telescope',
              { exit = true, desc = 'list all pickers' }
            },
            { '<Esc>', nil, { exit = true, nowait = true } }
          }
        }
      )
    end
  }
}
