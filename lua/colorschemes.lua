----------------------------------------------
--   ┌─┐┌─┐┬  ┌─┐┬─┐┐─┐┌─┐┬ ┬┬─┐┌┌┐┬─┐┐─┐   --
--   │  │ ││  │ ││┬┘└─┐│  │─┤├─ │││├─ └─┐   --
--   └─┘┘─┘┆─┘┘─┘┆└┘──┘└─┘┆ ┴┴─┘┘ ┆┴─┘──┘   --
----------------------------------------------
return {
    -- {{{ citruszest
    {
        'zootedb0t/citruszest.nvim',
        lazy = true,
        priority = 998,
        config = function()
            local lualine = require 'lualine'

            lualine.setup {
                options = { theme = 'citruszest' }
            }
            vim.cmd('colorscheme citruszest')
        end
    }
    ---- }}}
}
