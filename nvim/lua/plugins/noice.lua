return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      lazy = true,
      event = "VeryLazy", -- Load nvim-notify lazily
      config = function()
        require("notify").setup({
          stages = "static", -- Disable animations for faster response
          timeout = 2000,
        })
        vim.notify = require("notify") -- Set it globally if needed
      end,
    },
  },
}
