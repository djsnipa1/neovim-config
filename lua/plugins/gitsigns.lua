return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map('n', '<leader>hn', gs.next_hunk, 'Next Hunk')
      map('n', '<leader>hp', gs.prev_hunk, 'Prevoius Hunk')
    end
  }
}
