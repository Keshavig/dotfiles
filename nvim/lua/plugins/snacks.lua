return {
  "folke/snacks.nvim",
  event = { "BufReadPre", "CmdlineEnter" }, -- Lazy-load on relevant events
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true }, -- Optimizations for large files
    dashboard = { enabled = true }, -- Enhancements for startup dashboard
    indent = { enabled = true }, -- Indentation guides
    input = { enabled = true }, -- Enhanced input dialogs
    notifier = { enabled = true }, -- Notification enhancements
    quickfile = { enabled = true }, -- Quick file management
    scroll = { enabled = false }, -- Disabled scrolling feature for performance
    statuscolumn = { enabled = true }, -- Status line enhancements
    words = { enabled = true }, -- Word-related enhancements
  },
}
