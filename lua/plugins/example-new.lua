return {
  -- {
  --   'nvim-neorg/neorg',
  --   -- lazy-load on filetype
  --   ft = 'norg',
  --   -- options for neorg. This will automatically call `require("neorg").setup(opts)`
  --   opts = { load = { ['core.defaults'] = {} } }
  -- },
  --
  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  { 'stevearc/dressing.nvim', event = 'VeryLazy' },

  {
    'Wansmer/treesj',
    keys = { { 'J', '<cmd>TSJToggle<cr>', desc = 'Join Toggle' } },
    opts = { use_default_keymaps = false, max_join_length = 150 }
  },

  {
    'monaqa/dial.nvim',
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    keys = { '<C-a>', { '<C-x>', mode = 'n' } }
  }

  -- local plugins need to be explicitly configured with dir
  -- { dir = "~/projects/secret.nvim" },

  -- local plugins can also be configure with the dev option.
  -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from Github
  -- With the dev option, you can easily switch between the local and installed version of a plugin
  -- { "folke/noice.nvim", dev = true },
}
