local files = require 'mini.files'

-- return {
--   {
--     'echasnovski/mini.files',
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     version = false,
--     keys = {
--       -- { 'J', '<cmd>TSJToggle<cr>', desc = 'Join Toggle' } },
--       {
--         '<Leader>mfm',
--         '',
--
--         desc = 'Focus current file in file explorer',
--         callback = function()
--           if not files.close() then
--             files.open(vim.api.nvim_buf_get_name(0))
--             files.reveal_cwd()
--           end
--         end
--
--       }
--     },
--     config = function()
--       require('mini.files').setup({})
--       -- Create mapping to show/hide dot-files ~
--       -- Create an autocommand for `MiniFilesBufferCreate` event which calls
--       -- MiniFiles.refresh() with explicit `content.filter` functions: >
--
--       local util = require('utils.variables')
--
--       local show_dotfiles = true
--
--       local fs_entry = { 'directory', 'lazytest', util.edit_path }
--
--       print(util.edit_path)
--       local filter_show = function(fs_entry) return true end
--
--       local filter_hide = function(fs_entry)
--         return not vim.startswith(fs_entry.name, '.')
--       end
--
--       local toggle_dotfiles = function()
--         show_dotfiles = not show_dotfiles
--         local new_filter = show_dotfiles and filter_show or filter_hide
--         MiniFiles.refresh({ content = { filter = new_filter } })
--       end
--
--       vim.api.nvim_create_autocmd(
--         'User', {
--           pattern = 'MiniFilesBufferCreate',
--           callback = function(args)
--             local buf_id = args.data.buf_id
--             -- Tweak left-hand side of mapping to your liking
--             vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
--           end
--         }
--       )
--
--     end
--
--   }
-- }

-- if true then return {} end

return {
  {
    'echasnovski/mini.files',
    event = { 'VimEnter' },
    opts = {
      windows = {
        -- Whether to show preview of directory under cursor
        preview = true
      }
    },
    config = function(_, opts)
      local show_dotfiles = true
      local filter_show = function() return true end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, '.')
      end
      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        MiniFiles.refresh({ content = { filter = new_filter } })
      end
      vim.api.nvim_create_autocmd(
        'User', {
          pattern = 'MiniFilesBufferCreate',
          callback = function(args)
            local buf_id = args.data.buf_id
            -- Tweak left-hand side of mapping to your liking
            vim.keymap.set(
              'n', 'H', toggle_dotfiles,
                { desc = 'Toggle hidden files', buffer = buf_id }
            )
          end
        }
      )
      require('mini.files').setup(opts)
    end,
    keys = {
      {
        -- "-",
        '<Leader>mfm',
        function() MiniFiles.open() end,
        desc = 'Open Mini Files'
      }
    }
  }
}
