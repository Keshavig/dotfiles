return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    config = function()
        require("lualine").setup {
            options = {
                theme = 'gruvbox',
            }
        }
    end,
--    enabled = not vim.env.TMUX, -- plugin will be disabled if TMUX is set
}
