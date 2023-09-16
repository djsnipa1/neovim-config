return {
  {
    'JoseConseco/hl_manager.nvim',
    config = function()
      local hl_manager = require 'hl_manager'
      -- hl_manager.highlight_from_src('HighlightUndo', 'CurSearch', { bg = -15 })
      hl_manager.match_hl_to_highlight(
        'HighlightUndo', 'CurSearch', { bg = -15 }
      )
      -- hl_manager.match_color_to_highlight("#a3be8c", "@punct.bracket",
      --                                     "rainbowcol2", "foreground")
      -- hl_manager.match_color_to_highlight("#88c0d0", "@punct.bracket",
      --                                     "rainbowcol3", "foreground")
      -- hl_manager.match_color_to_highlight("#6ea1ec", "@punct.bracket",
      --                                     "rainbowcol4", "foreground")
      -- hl_manager.match_color_to_highlight("#b48ead", "@punct.bracket",
      --                                     "rainbowcol5", "foreground")
      -- hl_manager.match_color_to_highlight("#df717a", "@punct.bracket",
      --                                     "rainbowcol6", "foreground")
      -- hl_manager.match_color_to_highlight("#d08770", "@punct.bracket",
      --                                     "rainbowcol7", "foreground")
    end
  }
}
