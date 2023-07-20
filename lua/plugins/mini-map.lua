return {
  {
    'echasnovski/mini.map',
    version = false,
    event = 'VeryLazy',
    -- lazy = false,
    config = function()
      require('mini.map').setup()

      -- opens MiniMap automatically when neovim launches
      -- Don't lazy load this!
      -- vim.cmd('au VimEnter * lua MiniMap.open()')

      local minimap = require('mini.map')
      minimap.setup(
        {
          integrations = {
            minimap.gen_integration.builtin_search(),
            minimap.gen_integration.diagnostic(
              {
                error = 'DiagnosticFloatingError',
                warn = 'DiagnosticFloatingWarn',
                info = 'DiagnosticFloatingInfo',
                hint = 'DiagnosticFloatingHint'
              }
            ),
            minimap.gen_integration.gitsigns()
          },
          symbols = {
            encode = minimap.gen_encode_symbols.dot('4x2')
          },
          window = {
            focusable = true,
            side = 'right',
            winblend = 75,
            width = 6,
            show_integration_count = false
          }
        }
      )
      vim.api.nvim_create_user_command(
        'MinimapToggle', function() minimap.toggle() end, {}
      )
    end,
    keys = {
      {
        '<Leader>mMc',
        '<Cmd>lua MiniMap.close()<CR>',
        -- function() MiniMap.close() end,
        -- MiniMap.close,
        { desc = 'MiniMap close' }
      },
      {
        '<Leader>mMf',
        '<Cmd>lua MiniMap.toggle_focus()<CR>',
        -- MiniMap.toggle_focus,
        { desc = 'MiniMap toggle focus' }
      },
      {
        '<Leader>mMo',
        '<Cmd>lua MiniMap.open()<CR>',
        -- MiniMap.open,
        { desc = 'MiniMap open' }
      },
      {
        '<Leader>mMr',
        '<Cmd>lua MiniMap.refresh()<CR>',
        -- MiniMap.refresh,
        { desc = 'MiniMap refresh' }
      },
      {
        '<Leader>mMs',
        '<Cmd>lua MiniMap.toggle_side()<CR>',
        -- MiniMap.toggle_side,
        { desc = 'MiniMap toggle side' }
      },
      {
        '<Leader>mMt',
        '<Cmd>lua MiniMap.toggle()<CR>',
        -- MiniMap.toggle,
        { desc = 'MiniMap toggle' }
      }
    }
  }
}
