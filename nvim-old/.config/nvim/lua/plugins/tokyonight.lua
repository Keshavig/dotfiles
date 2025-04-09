return {
    --"Keshavig/tokyonight.nvim",
    "Keshavig/tokyonight.nvim",
    opts = {
        style = "night",
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
        },

        lualine_bold = true,
        transparent = false,
        terminal_colors = true,

        cache = true,

        plugins = {
            all = package.loaded.lazy == nil,
            auto = true,
        },
    }
}
