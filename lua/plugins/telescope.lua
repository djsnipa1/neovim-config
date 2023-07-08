local xdg_config_home = vim.fn.expand('$XDG_CONFIG_HOME')
local nvim_appname = vim.fn.expand('$NVIM_APPNAME')
local config_path =
    xdg_config_home .. '/' .. nvim_appname .. '/lua'
local xdg_data_home = vim.fn.expand('$XDG_DATA_HOME')
local lazyvim_path = xdg_data_home .. '/' .. nvim_appname ..
                         '/lazy/LazyVim/lua/lazyvim'

return {
    -- if true then return {} end
    {
        'nvim-telescope/telescope.nvim',
        keys = {
            {
                '<leader>mte',
                function()
                    require('telescope.builtin').find_files(
                        {
                            cwd = config_path,
                            -- find_command = {
                            --     'fd', '--type', 'f', '--follow', '--hidden',
                            --     '--exclude', '.git', config_path
                            -- },
                            hidden = true
                        }
                    )
                end,
                desc = 'Neovim Config Files'
            },
            {
                '<leader>fp',
                function()
                    require('telescope.builtin').find_files(
                        {
                            cwd = require('lazy.core.config').options
                                .root
                        }
                    )
                end,
                desc = 'Find Plugin File'
            },
            {
                '<leader>mth',
                function()
                    require('telescope.builtin').highlights(
                        {
                            cwd = require('lazy.core.config').options
                                .root
                        }
                    )
                end,
                desc = 'Highlights'
            },
            {
                '<leader>mt.',
                function()
                    require'telescope.builtin'.find_files(
                        require(
                            'telescope.themes'
                        ).get_dropdown({ winblend = 20 })
                    )
                end,
                desc = 'Telescope Test'
            },
            {
                '<leader>r',
                function()
                    require'telescope.builtin'.resume()
                end,
                desc = 'Telescope Resume'
            }
        },
        -- nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
        -- " Change an option
        -- nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
        -- change some options
        opts = {
            defaults = {
                -- layout_strategy = 'horizontal',
                layout_strategy = 'vertical',
                layout_config = { prompt_position = 'top' },
                sorting_strategy = 'ascending',
                winblend = 0,
                preview = {
                    -- {{{ preview images
                    mime_hook = function(
                        filepath, bufnr, opts
                    )
                        local is_image =
                            function(filepath)
                                local image_extensions = {
                                    'png',
                                    'jpg'
                                } -- Supported image formats
                                local split_path =
                                    vim.split(
                                        filepath:lower(),
                                            '.', {
                                                plain = true
                                            }
                                    )
                                local extension =
                                    split_path[#split_path]
                                return
                                    vim.tbl_contains(
                                        image_extensions,
                                            extension
                                    )
                            end
                        if is_image(filepath) then
                            local term = vim.api
                                             .nvim_open_term(
                                bufnr, {}
                            )
                            local function send_output(
                                _, data, _
                            )
                                for _, d in ipairs(data) do
                                    vim.api.nvim_chan_send(
                                        term, d .. '\r\n'
                                    )
                                end
                            end
                            vim.fn.jobstart(
                                {
                                    'catimg', -- 'viu',
                                    filepath -- Terminal image viewer command
                                }, {
                                    on_stdout = send_output,
                                    stdout_buffered = true,
                                    pty = true
                                }
                            )
                        else
                            require(
                                'telescope.previewers.utils'
                            ).set_preview_message(
                                bufnr, opts.winid,
                                    'Binary cannot be previewed'
                            )
                        end
                    end
                    -- }}}
                }

            }
        }
    },
    {
        'jvgrootveld/telescope-zoxide',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        },
        lazy = true,
        keys = {
            {
                '<leader>mtz',
                function()
                    require('telescope').load_extension 'zoxide'
                    require('telescope').extensions.zoxide
                        .list(
                        {
                            -- require'telescope.builtin'.extensions.zoxide.list {
                            results_title = 'Z Directories',
                            prompt_title = 'Z Prompt'
                        }
                    )
                end,
                desc = 'Telescope Zoxide'
            }
        },
        config = function()
            -- Useful for easily creating commands
            local z_utils = require(
                'telescope._extensions.zoxide.utils'
            )

            require('telescope').setup {
                -- (other Telescope configuration...)
                extensions = {
                    zoxide = {
                        prompt_title = '[ Walking on the shoulders of TJ ]',
                        mappings = {
                            default = {
                                after_action = function(
                                    selection
                                )
                                    print(
                                        'Update to (' ..
                                            selection.z_score ..
                                            ') ' ..
                                            selection.path
                                    )
                                end

                            },
                            ['<C-s>'] = {
                                before_action = function(
                                    selection
                                )
                                    print('before C-s')
                                end,
                                action = function(selection)
                                    vim.cmd.edit(
                                        selection.path
                                    )
                                end

                            },
                            -- Opens the selected entry in a new split
                            ['<C-q>'] = {
                                action = z_utils.create_basic_command(
                                    'split'
                                )
                            }
                        }
                    }
                }
            }
        end

    },
    {
        'debugloop/telescope-undo.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim'
        },
        keys = {
            {
                '<Leader>mtu',
                '<cmd>Telescope undo<CR>',
                desc = 'Telescope Undo'
            }
        },
        config = function()
            require('telescope').setup(
                {
                    extensions = {
                        undo = {
                            use_delta = true,
                            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
                            side_by_side = false,
                            diff_context_lines = vim.o
                                .scrolloff,
                            entry_format = 'state #$ID, $STAT, $TIME',
                            time_format = '%m/%d/%y %I:%M',
                            mappings = {
                                i = {
                                    -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                                    -- you want to replicate these defaults and use the following actions. This means
                                    -- installing as a dependency of telescope in it's `requirements` and loading this
                                    -- extension from there instead of having the separate plugin definition as outlined
                                    -- above.
                                    ['<cr>'] = require(
                                        'telescope-undo.actions'
                                    ).yank_additions,
                                    ['<S-cr>'] = require(
                                        'telescope-undo.actions'
                                    ).yank_deletions,
                                    ['<C-cr>'] = require(
                                        'telescope-undo.actions'
                                    ).restore
                                }
                            }
                        }
                    }
                }
            )
            require('telescope').load_extension('undo')
            -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end

    }
}
