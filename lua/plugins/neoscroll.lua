return {
  {
    'karb94/neoscroll.nvim',
    config = true,
    -- opts = { easing_function = 'quintic' }
    opts = function()
      require('neoscroll').setup(
        {
          easing_function = 'quintic', -- Default easing function
          -- pre_hook = function(info) if info == "cursorline" then vim.wo.cursorline = false end end,
          post_hook = function(info)
            if info == 'add_zz' then vim.api.nvim_command('zz') end
          end
        }
      )

      local t = {}

      t['<C-u>'] = {
        'scroll',
        { '-vim.wo.scroll', 'true', '1550', 'quintic', [['add_zz']] }
      }
      t['<C-d>'] = {
        'scroll',
        { 'vim.wo.scroll', 'true', '1550', 'quintic', [['add_zz']] }
      }
      require('neoscroll.config').set_mappings(t)

      -- Syntax: t[keys] = {function, {function arguments}}
      -- Use the "sine" easing function
      -- t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '350', [['sine']] } }
      -- t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']] } }
      -- Use the "circular" easing function
      -- t['<C-b>'] = {
      --   'scroll',
      --   { '-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']] }
      -- }
      -- t['<C-f>'] = {
      --   'scroll',
      --   { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']] }
      -- }
      -- Pass "nil" to disable the easing animation (constant scrolling speed)
      -- t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100', nil } }
      -- t['<C-e>'] = { 'scroll', { '0.10', 'false', '100', nil } }
      -- When no easing function is provided the default easing function (in this case "quadratic") will be used
      -- t['zt'] = { 'zt', { '300' } }
      -- t['zz'] = { 'zz', { '300' } }
      -- t['zb'] = { 'zb', { '300' } }

      -- require('neoscroll.config').set_mappings(t)
    end
  }
}
