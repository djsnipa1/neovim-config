if true then return {} end

return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = true,
    opts = {
      exclude_filetype = {
        aerial = true,
        NvimTree = true,
        MiniFiles = true,
        oil = false,
        dashboard = true,
        Starter = false,
      },
      indent = {
        chars = { '│', '¦', '┆', '┊' },
        -- chars = { "│" },
        -- style = {
        --   "#FF0000",
        --   "#FF7F00",
        --   "#FFFF00",
        --   "#00FF00",
        --   "#00FFFF",
        --   "#0000FF",
        --   "#8B00FF",
        -- },
      },
      blank = {
        chars = { "․", "⁚", "⁖", "⁘", "⁙" },
        style = { "#666666", "#555555", "#444444" },
      },
      chunk = {
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "┌",
          left_bottom = "└",
          right_arrow = "─",
        },
        -- style = "#00ffff",
        style = {
          vim.fn.synIDattr(
            vim.fn.synIDtrans(vim.fn.hlID("Whitespace")),
            "fg",
            "gui"
          ),
        },
      },
      line_num = {
        enable = false
      },
    },
  },
}
