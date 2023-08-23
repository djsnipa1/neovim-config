--[[
-- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --  add your custom lualine config here  
      }
    end,
  },
--]] -- spacer
local Util = require('lazyvim.util')
local colors = {
    [''] = Util.fg('Special'),
    ['Normal'] = Util.fg('Special'),
    ['Warning'] = Util.fg('DiagnosticError'),
    ['InProgress'] = Util.fg('DiagnosticWarn')
}

-- local colors = {
--   red = '#ca1243',
--   grey = '#a0a1a7',
--   black = '#383a42',
--   white = '#f3f3f3',
--   light_green = '#83a598',
--   orange = '#fe8019',
--   green = '#8ec07c'
-- }

-- local theme = {
--   normal = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.white },
--     z = { fg = colors.white, bg = colors.black }
--   },
--   insert = { a = { fg = colors.black, bg = colors.light_green } },
--   visual = { a = { fg = colors.black, bg = colors.orange } },
--   replace = { a = { fg = colors.black, bg = colors.green } }
-- }

-- {{{ gruvbox theme
-- local colors = {
--   black        = '#282828',
--   white        = '#ebdbb2',
--   red          = '#fb4934',
--   green        = '#b8bb26',
--   blue         = '#83a598',
--   yellow       = '#fe8019',
--   gray         = '#a89984',
--   darkgray     = '#3c3836',
--   lightgray    = '#504945',
--   inactivegray = '#7c6f64',
-- }
-- return {
--   normal = {
--     a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.lightgray, fg = colors.white},
--     c = {bg = colors.darkgray, fg = colors.gray}
--   },
--   insert = {
--     a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.lightgray, fg = colors.white},
--     c = {bg = colors.lightgray, fg = colors.white}
--   },
--   visual = {
--     a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.lightgray, fg = colors.white},
--     c = {bg = colors.inactivegray, fg = colors.black}
--   },
--   replace = {
--     a = {bg = colors.red, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.lightgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   command = {
--     a = {bg = colors.green, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.lightgray, fg = colors.white},
--     c = {bg = colors.inactivegray, fg = colors.black}
--   },
--   inactive = {
--     a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.gray},
--     c = {bg = colors.darkgray, fg = colors.gray}
--   }
-- }
-- require('lualine').setup {options = {theme = gruvbox}}
-- }}}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end


-- Put proper separators and gaps between components in sections
local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < 'x'
        for pos = 1, name ~= 'lualine_z' and #section or
            #section - 1 do
            table.insert(
                section, pos * 2, {
                    empty,
                    color = {
                        fg = colors.white,
                        bg = colors.white
                    }
                }
            )
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = '' } or
                                 { left = '' }
        end
    end
    return sections
end


local function search_result()
    if vim.v.hlsearch == 0 then return '' end
    local last_search = vim.fn.getreg('/')
    if not last_search or last_search == '' then
        return ''
    end
    local searchcount = vim.fn
                            .searchcount { maxcount = 9999 }
    return
        last_search .. '(' .. searchcount.current .. '/' ..
            searchcount.total .. ')'
end


local function modified()
    if vim.bo.modified then
        return '+'
    elseif vim.bo.modifiable == false or vim.bo.readonly ==
        true then
        return '-'
    end
    return ''
end


local slash = function()
    require('lualine').setup {
        options = {
            theme = theme,
            component_separators = '',
            section_separators = {
                left = '',
                right = ''
            }
        },
        sections = process_sections {
            lualine_a = { 'mode' },
            lualine_b = {
                'branch',
                'diff',
                {
                    'diagnostics',
                    source = { 'nvim' },
                    sections = { 'error' },
                    diagnostics_color = {
                        error = {
                            bg = colors.red,
                            fg = colors.white
                        }
                    }
                },
                {
                    'diagnostics',
                    source = { 'nvim' },
                    sections = { 'warn' },
                    diagnostics_color = {
                        warn = {
                            bg = colors.orange,
                            fg = colors.white
                        }
                    }
                },
                { 'filename', file_status = false, path = 1 },
                { modified, color = { bg = colors.red } },
                {
                    '%w',
                    cond = function()
                        return vim.wo.previewwindow
                    end

                },
                {
                    '%r',
                    cond = function()
                        return vim.bo.readonly
                    end

                },
                {
                    '%q',
                    cond = function()
                        return vim.bo.buftype == 'quickfix'
                    end

                }
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = { search_result, 'filetype' },
            lualine_z = { '%l:%c', '%p%%/%L' }
        },
        inactive_sections = {
            lualine_c = { '%f %y %m' },
            lualine_x = {}
        }
    }
end


return {
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        config = slash
        -- opts = function()
        --   return {
        --     --  add your custom lualine config here  
        --   }
        -- end,
    }
}
