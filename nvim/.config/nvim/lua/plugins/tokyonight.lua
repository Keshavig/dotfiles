return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,

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
