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

   { "echasnovski/mini.ai", enabled = false }

} end

