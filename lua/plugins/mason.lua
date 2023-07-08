return {
  {
    'williamboman/mason.nvim',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    opts = function(_, opts)
      if true == true then
        opts.ensure_installed = {
          -- "stylua",
          'shfmt'
        }
      else
        opts = {}
      end
    end
  }
}
