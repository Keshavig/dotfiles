return {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,

    opts = {
        style = "night",
        styles = {
            comments = { italic = false },
            functions = { italic = false },
            keywords = { italic = false },
            variables = { italic = false },

            sidebars = "dark",
            floats = "dark",
        },
    },
}
