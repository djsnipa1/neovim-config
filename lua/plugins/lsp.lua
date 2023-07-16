return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = { mason = false },
        nil_ls = { mason = false },
        lua_ls = { mason = false },
        emmet_ls = { mason = false },
        -- prettierd = { mason = false },
        -- eslint_d = { mason = false },
        svelte = { mason = false },
        bashls = { mason = false }
      }
    }
  }
}
