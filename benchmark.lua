require('plenary/benchmark')(
  'vim.api.nvim_set_hl vs vim.cmd', {
    warmup = 0,
    runs = 5,
    fun = {
      {
        'nvim_set_hl',
        function()
          vim.api.nvim_set_hl(0, 'Normal', { fg = '#FF0000', bg = '#00FF00' })
        end
      },
      {
        'vim.cmd',
        function()
          vim.cmd([[highlight! Normal guifg=#FF0000, guibg=#00FF00]])
        end
      }
    }
  }
)
