return {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    lazy = false,
    priority = 10000,

    opts = {
        dark_variant = true,
        dim_inactive_windows = true,
        variant = "dark",
        extend_background_behind_borders = false,

        enable = {
            terminal = true,
        },

        styles = {
            bold = false,
            italic = false,
            transparency = true,
        },
    },
}
