return {
  {
    'natecraddock/workspaces.nvim',
    config = function()
      -- require('workspaces').setup({ hooks = { open = 'NvimTreeOpen' } })
      require('workspaces').setup(
        {
          hooks = {
            -- hooks run before change directory
            open_pre = {
              -- If recording, save current session state and stop recording
              -- 'SessionsStop',

              -- delete all buffers (does not save changes)
              -- 'silent %bdelete!'
            },

            -- hooks run after change directory
            open = {
              -- load any saved session from current directory
              function()
                -- require('mini.files').setup({})
                MiniFiles.open()
              end
            }
          }
        }
      )

      require('telescope').load_extension('workspaces')
    end
  }
}
