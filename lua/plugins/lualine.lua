-- if true then return {} end
---- {
--   'nvim-lualine/lualine.nvim',
--   event = 'VeryLazy',
--   opts = function() return { --[[add your custom lualine config here]] } end
-- }
local useCopilot = true

if useCopilot == true then
    print('useCopilot is true')
else
    print('useCopilot is false')
end

-- if true then return {} end
if useCopilot == true then
    -- {{{ useCopilot = true
    return {
        {
            'nvim-lualine/lualine.nvim',
            enabled = false,
            event = 'VeryLazy',
            opts = function(_, opts)
                local Util = require('lazyvim.util')
                local colors = {
                    [''] = Util.fg('Special'),
                    ['Normal'] = Util.fg('Special'),
                    ['Warning'] = Util.fg('DiagnosticError'),
                    ['InProgress'] = Util.fg(
                        'DiagnosticWarn'
                    )
                }
                table.insert(
                    opts.sections.lualine_x, 2, {
                        function()
                            local icon = require(
                                             'lazyvim.config'
                                         ).icons.kinds
                                             .Copilot
                            local status = require(
                                               'copilot.api'
                                           ).status.data
                            return icon ..
                                       (status.message or '')
                        end,
                        cond = function()
                            local ok, clients = pcall(
                                vim.lsp.get_active_clients,
                                    {
                                        name = 'copilot',
                                        bufnr = 0
                                    }
                            )
                            return ok and #clients > 0
                        end,
                        color = function()
                            if not package.loaded['copilot'] then
                                return
                            end
                            local status = require(
                                               'copilot.api'
                                           ).status.data
                            return colors[status.status] or
                                       colors['']
                        end

                    }
                )
                return {
                    sections = {
                        lualine_z = {
                            function()
                                -- return " " .. os.date("%R")
                                local chad = require(
                                                 'lazyvim.config'
                                             ).icons.kinds
                                                 .Event
                                return ' ' .. chad
                            end
                        }
                    }
                }
            end

        }
    }
    -- }}}
else
end
