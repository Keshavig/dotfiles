return {
   "saghen/blink.cmp",
   dependencies = "rafamadriz/friendly-snippets",
   version = "*",
   event = "InsertEnter", -- Lazy load when entering insert mode
   opts = {
      keymap = {
         preset = "super-tab",
      },
      sources = {
         default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
         ghost_text = { enabled = false },
         documentation = { treesitter_highlighting = true },
         menu = {
            border = "rounded",
            scrollbar = false,
            direction_priority = { "s", "n" },
            winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:Visual,Search:None",
            winblend = 0,
            draw = {
               treesitter = { "lsp" },
               columns = { { "kind_icon" }, { "label" } },
            },
         },
      },
   },
}
