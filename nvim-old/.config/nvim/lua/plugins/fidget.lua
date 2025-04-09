return {
   "j-hui/fidget.nvim",
   event = "LspAttach",  -- Lazy-load when an LSP client attaches
   opts = {
      -- LSP progress related options
      progress = {
         poll_rate = 0,                -- Disable polling for progress (improves performance)
         suppress_on_insert = true,    -- Suppress progress messages while in insert mode
         ignore_done_already = true,   -- Ignore completed tasks to save resources
      },

      -- Notification rendering options
      notification = {
         poll_rate = 10,               -- How frequently to update notifications
         filter = vim.log.levels.INFO, -- Minimum level of notifications
         history_size = 50,            -- Limit notification history size
      },
   },
}
