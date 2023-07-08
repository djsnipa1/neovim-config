return {
  'ThePrimeagen/harpoon',
  lazy = true,
  config = function()
    require('harpoon').setup({
      menu = {
        -- width = vim.api.nvim_win_get_width(0) - 8,
        width = math.floor(vim.o.columns * 0.3),
        height = math.floor(vim.o.lines * 0.7)
      }
    })

    require('telescope').load_extension('harpoon')
  end,
  keys = {
    {
      '<leader>mhm',
      function() require('harpoon.ui').toggle_quick_menu() end,
      desc = 'Harpoon Toggle Menu'
    },
    {
      '<leader>mha',
      function() require('harpoon.mark').add_file() end,
      desc = 'Harpoon Add File'
    },
    {
      '<leader>mhn',
      function() require('harpoon.ui').nav_next() end,
      desc = 'Harpoon Next'
    },
    {
      '<leader>mhp',
      function() require('harpoon.ui').nav_prev() end,
      desc = 'Harpoon Previous'
    },
    {
      '<leader>mht',
      function() require('harpoon.tmux').gotoTerminal(1) end,
      desc = 'gotoTerminal(1)'
    },
    -- lua require("harpoon.tmux").sendCommand(1, "ls -La")    -- sends ls -La to tmux window 1
    -- lua require("harpoon.tmux").sendCommand(1, 1)           -- sends command 1 to tmux window 1
    opts = {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = true,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { 'harpoon' },

      -- set marks specific to each git branch inside git repository
      mark_branch = true
    }
  }
}
--   wk.register({
--     ["<leader>h"] = {
--       name = "Harpoon",
--       a = { mark.add_file, { desc = "add file" } },
--       m = { ui.toggle_quick_menu, { desc = "toggle quick menu" } },
--
--       o = {
--         function()
--           ui.nav_file(1)
--         end,
--         { desc = "file one" },
--       },
--       t = {
--         function()
--           ui.nav_file(2)
--         end,
--         { desc = "file two" },
--       },
--       h = {
--         function()
--           ui.nav_file(3)
--         end,
--         { desc = "file three" },
--       },
--       f = {
--         function()
--           ui.nav_file(4)
--         end,
--         { desc = "file four" },
--       },
--     },
--   })
-- end,
--
