return {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    enabled = false,

    config = function()
        require('onedark').setup {
            style = 'darker',
            code_style = {
                comments = 'none',
            }
        }
    end,
}
