local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim",  opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("lazyvim.util").has("nvim-cmp")
        end,
      },
    },
    opts = {
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = { mason = false },
        nil_ls = { mason = false },
        -- TODO: Add config for lua-language-server
        lua_ls = {
          mason = false,
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim',
                  'require' }
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true)
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = { enable = false }
            }
          }
        },
        emmet_ls = {
          mason = true,
          capabilities = capabilities,
          filetypes = {
            'css',
            'eruby',
            'html',
            'javascript',
            'javascriptreact',
            'less',
            'sass',
            'scss',
            'svelte',
            'pug',
            'typescriptreact',
            'vue'
          },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ['bem.enabled'] = true
              }
            }
          }
        },
        -- prettierd = { mason = false },
        -- eslint_d = { mason = false },
        svelte = { mason = false },
        bashls = { mason = false }
      }
    }
  }
}
