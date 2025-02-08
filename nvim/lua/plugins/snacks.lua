return {
    "folke/snacks.nvim",
    enabled = true,
    event = { "BufReadPre", "CmdlineEnter" }, -- Lazy-load on relevant events
    opts = {
        bigfile = { enabled = true }, -- Optimizations for large files
        dashboard = { enabled = false }, -- Enhancements for startup dashboard
        indent = { enabled = true }, -- Indentation guides
        input = { enabled = true }, -- Enhanced input dialogs
        notifier = { enabled = false }, -- Notification enhancements
        quickfile = { enabled = true }, -- Quick file management
        scroll = { enabled = false }, -- Disabled scrolling feature for performance
        statuscolumn = { enabled = false }, -- Status line enhancements
        words = { enabled = true }, -- Word-related enhancements
    },
}
