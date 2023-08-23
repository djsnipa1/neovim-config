return {
  'jose-elias-alvarez/null-ls.nvim',
  opts = function()
    local nls = require('null-ls')
    return {
      root_dir = require('null-ls.utils').root_pattern(
        '.null-ls-root', '.neoconf.json', 'Makefile', '.git'
      ),
      debug = false,
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.statix,
        nls.builtins.code_actions.statix,
        -- nls.builtins.formatting.stylua,
        nls.builtins.formatting.lua_format,
        nls.builtins.diagnostics.luacheck,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.alejandra,
        nls.builtins.formatting.nixfmt,
        nls.builtins.formatting.nixpkgs_fmt,
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.prettier_d_slim,
        -- nls.builtins.formatting.prettier_eslint,
        nls.builtins.formatting.jq,
        nls.builtins.formatting.blue,
        nls.builtins.formatting.htmlbeautifier,
        nls.builtins.code_actions.shellcheck,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.code_actions.eslint_d,
        nls.builtins.formatting.eslint_d,
        -- nls.builtins.diagnostics.eslint_d.with(
        --   { diagnostics_format = '[eslint] #{m}\n(#{c})' }
        -- )
        -- nls.builtins.diagnostics.flake8,
      }
    }
  end
}
