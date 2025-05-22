return {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    enabled = true,

    config = function()
        require('onedark').setup {
            style = 'darker',
            code_style = {
                comments = 'none',
            }
        }
    end,
}
