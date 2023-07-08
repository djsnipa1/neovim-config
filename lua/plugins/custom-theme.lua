return {
    {
        "Djancyp/custom-theme.nvim",
        config = true,
        -- config = function() require("custom-theme").setup() end,
        lazy = true,
        dependencies = {
            {"norcalli/nvim-colorizer.lua", config = true},
            {"nvim-lua/plenary.nvim"}
        },
        cmd = "CustomTheme",
        keys = { { "<leader>mct", "<cmd>CustomTheme<cr>", desc = "Symbols Outline" } },
    }
}
