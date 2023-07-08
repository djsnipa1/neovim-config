return {
  {
    'folke/noice.nvim',
    keys = {
      {
        '<leader>mnl',
        function() require('noice').cmd('last') end,
        { desc = 'Noice Last' }
      },
      {
        '<leader>mnh',
        function() require('noice').cmd('history') end,
        { desc = 'Noice History' }
      },
      {
        '<leader>mne',
        function() require('noice').cmd('errors') end,
        { desc = 'Noice Errors' }
      },
      {
        '<leader>mns',
        function() require('noice').cmd('stats') end,
        { desc = 'Noice Stats' }
      }
    }
  }
}
