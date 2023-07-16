local function cmd(command)
  return table.concat({ '<Cmd>', command, '<CR>' })
end

local keys_table = {
  -- local a = table.pack(10,20,30)
  -- for _, v in pairs(a) do print(v) end

  -- vim.keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
  {
    '<C-w>z',
    cmd 'WindowsMaximize',
    desc = 'Windows Maximize'
  },
  {
    '<Leader>mom',
    cmd 'WindowsMaximize',
    desc = 'Windows Maximize'
  },
  -- vim.keymap.set(
  --   'n', '<C-w>_', cmd 'WindowsMaximizeVertically'
  -- )
  {
    '<C-w>_',
    cmd 'WindowsMaximizeVertically',
    desc = 'Windows Maximize Vertically'
  },
  {
    '<Leader>mov',
    cmd 'WindowsMaximizeVertically',
    desc = 'Windows Maximize Vertically'
  },
  -- vim.keymap.set(
  --   'n', '<C-w>|', cmd 'WindowsMaximizeHorizontally'
  -- )
  {
    '<C-w>/',
    cmd 'WindowsMaximizeHorizontally',
    desc = 'Windows Maximize Horizontally'
  },
  {
    '<Leader>moh',
    cmd 'WindowsMaximizeHorizontally',
    desc = 'Windows Maximize Horizontally'
  },
  -- vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')
  {
    '<C-w>=',
    cmd 'WindowsEqualize',
    desc = 'Windows Equalize'
  },
  {
    '<Leader>moe',
    cmd 'WindowsEqualize',
    desc = 'Windows Equalize'
  }

  -- myTable = {}
  -- table.insert(myTable, 'Lua')
  -- table.insert(myTable, 'value')

}

return {
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim'
    },
    keys = keys_table,
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }
}
