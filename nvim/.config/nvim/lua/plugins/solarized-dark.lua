return {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
        vim.o.termguicolors = true
        vim.o.background = 'dark'
        require('solarized').setup({
            styles = {
                comments = { italic = false, bold = false },
                functions = { italic = false },
                variables = { italic = false },
            }
        })
    end,
}
