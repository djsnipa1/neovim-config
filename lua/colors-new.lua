-- nebulous
local function nebulous_config()
    local nebulous = require 'nebulous'
    nebulous.setup {
        variant = 'midnight',
        disable = {
            background = false,
            endOfBuffer = false,
            terminal_colors = false
        },
        italic = {
            comments = true,
            keywords = true,
            functions = true,
            variables = true
        }
        --   custom_colors = { -- this table can hold any group of colors with their respective values
        --     LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },
        --     CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },
        --
        --     -- it is possible to specify only the element to be changed
        --     TelescopePreviewBorder = { fg = "#A13413" },
        --     LspDiagnosticsDefaultError = { bg = "#E11313" },
        --     TSTagDelimiter = { style = "bold,italic" },
    }
end

-- fluoromachine
local function fm_config()
    local fm = require 'fluoromachine'
    fm.setup {
        glow = true,
        -- theme = "fluoromachine",
        theme = 'retrowave'
    }

    -- vim.cmd('colorscheme "fluoromachine"')

    local lualine = require 'lualine'
    lualine.setup { options = { theme = 'fluoromachine' } }
end

-- kimbie
local function kimbie_config()
    require('kimbie').setup()('lualine').setup {
        options = { theme = 'kimbie' }
    }
end

return {
    -- {
    --     "maxmx03/fluoromachine.nvim",
    --     -- event = "VeryLazy",
    --     lazy = false,
    --     priority = 1000,
    --     config = fm_config
    -- },

    -- nebulous
    {
        'Yagua/nebulous.nvim',
        -- event = "VeryLazy",
        lazy = true,
        priority = 1000,
        config = nebulous_config
    },
    { 'rhcher/srcery.nvim' }, --   { "sainnhe/everforest",
    --   lazy = true,
    --   priority = 999,
    --   -- event = "VeryLazy",
    --   config = function()
    --     -- local opt = vim.opt
    --     vim.g.everforest_background = "hard"
    --     -- let g:everforest_background = 'hard'
    --     let g:everforest_better_performance = 1
    --     vim.g.everforest_enable_italic = 1
    --     vim.g.everforest_dim_inactive_windows = 1
    --     vim.g.everforest_sign_column_background = "grey"
    --     vim.g.everforest_spell_foreground = "colored"
    --     vim.g.everforest_ui_contrast = "high"
    --     vim.g.everforest_diagnostic_text_highlight = 1
    --     vim.g.everforest_diagnostic_line_highlight = 1
    --     vim.g.everforest_diagnostic_virtual_text = "colored"
    --     vim.g.everforest_disable_terminal_colors = 1
    --     require("everforest").colorscheme()
    --     require "colorscheme"
    --   end,
    -- },
    -- {
    --   "dnamsons/kimbie.nvim",
    --   lazy = true,
    --   event = "VeryLazy",
    --   priority = 996,
    --   -- config = kimbie_config,
    --   config = function()
    --     require("kimbie").setup()("lualine").setup { options = { theme = "kimbie" } }
    --     require "colorscheme"
    --   end,
    -- },
    {
        'rose-pine/neovim',
        lazy = false,
        opts = { variant = 'moon' }
    },
    {
        'elvessousa/sobrio',
        priority = 995,
        lazy = false
        -- opts = { variant = "moon" }
    },
    {
        'nyngwang/nvimgelion',
        priority = 1000,
        config = function()
            require'nvim-treesitter.configs'.setup {
                highlight = { enable = true }
            }
        end
    }
}

-- -- in feline.lua: -- wrap the whole config in some function
-- local function config()
--   local theme = require("azemetre.theme")
--   local colors = theme.colors
--   local icons = theme.icons -- entire rest of what is currently in feline.lua in here
-- end
--
-- -- feline spec:
-- return {
--   { "feline-nvim/feline.nvim",
--     event = "VeryLazy",
--     config = config },
-- }

-- M.current_colors = function()
--   local colors = M.colors.tokyonight_colors
--   if not lvim.builtin.time_based_themes then
--     return colors
--   end
--   local _time = os.date "*t"
--   if _time.hour >= 1 and _time.hour < 9 then
--     colors = M.colors.rose_pine_colors
--     -- colors = M.colors.catppuccin_colors
--   elseif _time.hour >= 9 and _time.hour < 17 then
--     colors = M.colors.tokyonight_colors
--   elseif _time.hour >= 17 and _
--     colors = M.colors.catppuccin_colors
--   elseif (_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1) then
--     colors = M.colors.kanagawa_colors
--   end
--   return colors
-- end

--     if has('termguicolors')
--       set termguicolors
--     endif
--     set background=light
--
--     let g:everforest_background = 'soft'
--     let g:everforest_better_performance = 1
--
--     colorscheme everforest
--     let g:lightline = {'colorscheme' : 'everforest'}

-- M.current_colors = function()
--   local colors = M.colors.tokyonight_colors
--   if not lvim.builtin.time_based_themes then
--     return colors
--   end
--   local _time = os.date "*t"
--   if _time.hour >= 1 and _time.hour < 9 then
--     colors = M.colors.rose_pine_colors
--     -- colors = M.colors.catppuccin_colors
--   elseif _time.hour >= 9 and _time.hour < 17 then
--     colors = M.colors.tokyonight_colors
--   elseif _time.hour >= 17 and _time.hour < 21 then
--     colors = M.colors.catppuccin_colors
--   elseif (_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1) then
--     colors = M.colors.kanagawa_colors
--   end
--   return colors
-- end

-- ui = {
--    border = "rounded",
--    icons = {
--      start = "",
--      event = "",
--      cmd = "",
--      ft = "",
--    },
--  },

-- Setup
-- vim.g.theme = "gruvbox"
