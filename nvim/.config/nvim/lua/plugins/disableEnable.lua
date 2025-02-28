-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {
    {
        "echasnovski/mini.animate",
        enabled = false,
    },

    {
        "folke/noice.nvim",
        enabled = true,
    },


    {
        "rafamadriz/friendly-snippets",
        build = function()
            require("friendly-snippets").load_snippets()
        end,
        event = "VeryLazy", -- Load snippets lazily
    },

    { "folke/flash.nvim", enabled = false },

    { "echasnovski/mini.ai", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },

    -- { "folke/todo-comments.nvim", enabled = false }

} end
