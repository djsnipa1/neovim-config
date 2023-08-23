if true then return {} end
local lua_formatter = {
  cmd = "lua-format",
  args = "-i",
  stdin = true,
}

return {
  {
    "nvimdev/guard.nvim",
    opts = function()
      local ft = require("guard.filetype")

      -- use clang-format and clang-tidy for c files
      -- ft('c'):fmt('clang-format')
      --        :lint('clang-tidy')

      -- use stylua to format lua files and no linter
      --
      ft("lua"):fmt(lua_formatter)

      -- use lsp to format first then use golines to format
      -- ft('go'):fmt('lsp')
      --         :append('golines')
      --         :lint('golangci')

      -- multiple files register
      -- ft('typescript,javascript,typescriptreact'):fmt('prettier')

      -- call setup LAST
      require("guard").setup({
        -- the only options for the setup function
        fmt_on_save = true,
        -- Use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = true,
      })
    end,
    cmd = "GuardFmt",
    keys = {
      {
        "<leader>mcg",
        "<cmd>GuardFmt<CR>",
        desc = "Guard Format",
        mode = { "n", "v" },
      },
    },
  },
}
