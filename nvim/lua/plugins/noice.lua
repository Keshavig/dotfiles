return {
  "folke/noice.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- {
    --   "rcarriga/nvim-notify",
    --   enabled = false,
    --   lazy = true,
    --   event = "VeryLazy", -- Load nvim-notify lazily
    --   config = function()
    --     require("notify").setup({
    --       merge_duplicates = true,
    --       stages = "static", -- Disable animations for faster response
    --       timeout = 2000,
    --     })
    --
    --     vim.notify = require("notify") -- Set it globally if needed
    --   end,
    -- },
  },
}
