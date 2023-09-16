return {
  {
    'tzachar/highlight-undo.nvim',
    opts = {
      duration = 2000,
      undo = {
        hlgroup = 'HighlightUndo',
        mode = 'n',
        lhs = 'u',
        map = 'undo',
        opts = {}
      },
      redo = {
        hlgroup = 'HighlightUndo',
        mode = 'n',
        lhs = '<C-r>',
        map = 'redo',
        opts = {}
      },
      highlight_for_count = true
    }
    -- config = function()
    --   vim.api
    --     .nvim_set_hl(0, 'HighlightUndo', { fg = '#92ff00', bg = '#00FF00' })
    -- end
  }
}
