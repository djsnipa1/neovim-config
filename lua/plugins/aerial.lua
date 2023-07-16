return {
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    init = function()
      require('lazyvim.util').on_attach(
        function(_, buffer)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set(
            'n', '{', 'AerialPrev',
              { desc = 'Aerial Prev', buffer = buffer }
          )
          vim.keymap.set(
            'n', '}', 'AerialNext',
              { desc = 'Aerial Next', buffer = buffer }
          )
          -- vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          -- vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end
      )
    end,
    keys = {
      {
        '<leader>a',
        '<cmd>AerialToggle!<CR>',
        desc = 'Aerial Toggle'
      }
    }
  }
}

-- require('aerial').setup({
--   -- optionally use on_attach to set keymaps when aerial has attached to a buffer
--   on_attach = function(bufnr)
--     -- Jump forwards/backwards with '{' and '}'
--     vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
--     vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
--   end
-- })
-- -- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
