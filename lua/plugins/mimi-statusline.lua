-- get the window width
local trunc_limit = 80

return {
  {
    'echasnovski/mini.statusline',
    version = false,
    enabled = true,
    config = function()
      require('mini.statusline').setup(
        {
          function()
            local mode, mode_hl = MiniStatusline.section_mode(
              { trunc_width = trunc_limit }
            )
            local git = MiniStatusline.section_git({ trunc_width = trunc_limit })
            local diagnostics = MiniStatusline.section_diagnostics(
              { trunc_width = trunc_limit }
            )
            local filename = MiniStatusline.section_filename(
              { trunc_width = trunc_limit }
            )
            local fileinfo = MiniStatusline.section_fileinfo(
              { trunc_width = trunc_limit }
            )
            local location = MiniStatusline.section_location(
              { trunc_width = trunc_limit }
            )

            return MiniStatusline.combine_groups(
              {
                { hl = mode_hl, strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl, strings = { location } }
              }
            )
          end,
          vim.api.nvim_set_hl(
            0, 'MiniStatuslineModeNormal', { fg = '#1d2021', bg = '#d5c4a1' }
          ),
          vim.api.nvim_set_hl(
            0, 'MiniStatuslineModeVisual', { fg = '#ff8000', bg = '#fabd2f' }
          )
        }
      )
    end
  }
}
