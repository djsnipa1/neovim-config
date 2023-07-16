------------------------------------------
--   ┌─┐┬─┐┬ ┐┐ ┬┬─┐┌─┐┐ │ ┌┐┐┐ ┬o┌┌┐   --
--   │ ┬│┬┘│ ││┌┘│─││ │┌┼┘ ││││┌┘││││   --
--   ┆─┘┆└┘┆─┘└┘ ┆─┘┘─┘┆ └o┆└┘└┘ ┆┘ ┆   --
------------------------------------------
return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup( -- { overrides = { SignColumn = { bg = '#D1FF00' } } }
      )
      vim.cmd('colorscheme gruvbox')
      -- vim.cmd('hi MiniTablineCurrent gui=underline')
      vim.api.nvim_set_hl(
        0, 'MiniStatuslineModeNormal',
          { fg = '#D1FF00', bg = '#282828' }
      )
      vim.api.nvim_set_hl(
        0, 'Comment', { fg = '#111111', bold = true }
      )
      vim.api.nvim_set_hl(
        0, 'Error', { fg = '#ffffff', undercurl = true }
      )
      vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })

    end
  },
  { 'LazyVim/LazyVim', opts = { colorscheme = 'gruvbox' } }
}

-- opts = function (_, opts)
-- if true == true then
-- opts.background_colour = "#1a1b26"
-- opts.level = 3
-- opts.timeout = 1500
-- opts.render = "minimal"
-- opts.top_down = false
-- opts.max_height = function()
-- return math.floor (vim.o.lines * 0.75)
-- end
-- opts.max_width = function()
-- return math.floor (vim.o.columns * 0.75)
-- end else
-- opts = 1}
-- end end,
