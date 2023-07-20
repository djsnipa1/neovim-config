return {
  {
    'ziontee113/icon-picker.nvim',
    dependencies = { 'stevearc/dressing.nvim' },
    config = function()
      require('icon-picker').setup(
        { disable_legacy_commands = true }
      )
    end,
    keys = {
      {
        '<Leader><Leader>i',
        '<cmd>IconPickerNormal<cr>',
        desc = 'Icon Picker'
      },
      {
        '<Leader><Leader>iy',
        '<cmd>IconPickerYank<cr>',
        desc = 'Icon Picker Yank'
      },
      {
        '<C-i>',
        '<cmd>IconPickerInsert<cr>',
        -- 
        desc = 'Icon Picker Insert',
        mode = { 'i' }
      }
    }
  }
}
