return {
    "nvim-lualine/lualine.nvim",
    enabled = false,
    config = function()
        require("lualine").setup {
            options = {
                theme = 'onedark',
            }
        }
    end,
--    enabled = not vim.env.TMUX, -- plugin will be disabled if TMUX is set
}
