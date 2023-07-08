return {
    {
        "kiran94/edit-markdown-table.nvim",
        config = function() require("edit-markdown-table").setup() end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "EditMarkdownTable",
    },
}
