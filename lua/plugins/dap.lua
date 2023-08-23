local dap = require('dap')
return {
  {
    'mfussenegger/nvim-dap',
    keys = {
      -- Set keymaps to control the debugger
      { '<F5>', dap.continue, desc = 'Debugger Continue' },
      { '<F10>', dap.step_over, desc = 'Debugger Step Over' },
      { '<F11>', dap.step_into, desc = 'Debugger Step Into' },
      { '<F12>', dap.step_out, desc = 'Debugger Step Out' },
      { '<leader>mb', dap.toggle_breakpoint, desc = 'Debugger Toggle Breakpoint' },
      {
        '<leader>mB',
        function()
          dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = 'Debugger Set Breakpoint'
      }

    }
  }
}
