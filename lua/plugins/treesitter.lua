return {

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash", "html", "css", "javascript", "json", "lua", "markdown",
                "markdown_inline", "nix", "python", "query", "regex", "svelte",
                "tsx", "typescript", "vim", "yaml"
            }
        }
    }, {
        "nvim-treesitter/playground",
        dependices = {"nvim-treesitter/nvim-treesitter"},
        config = function()
            require"nvim-treesitter.configs".setup {
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                    persist_queries = false, -- Whether the query persists across vim sessions
                    keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus_language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?'
                    }
                }
            }
        end
    }
    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    -- {
    --   "nvim-treesitter/nvim-treesitter",
    --   opts = function(_, opts)
    --     -- add tsx and treesitter
    --     vim.list_extend(opts.ensure_installed, { "tsx", "typescript" })
    --   end,
    -- },   -- the opts function can also be used to change the default opts:

}
