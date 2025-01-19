return {
   "rose-pine/neovim",
   name = "rose-pine",
   event = "VeryLazy",

   opts = {
      -- Streamlined settings for faster startup
      dark_variant = true,
      dim_inactive_windows = true,
      variant = "auto",  -- auto variant
      extend_background_behind_borders = false,

      enable = {
         terminal = true,  -- Enable terminal colors
         legacy_highlights = false, -- Only enable if necessary
         migrations = false, -- Only enable if dealing with deprecated options
      },

      styles = {
         bold = false,
         italic = false,
         transparency = true,  -- Keep transparency if you need it
      },

      groups = {
         border = "muted",
         link = "iris",
         panel = "surface",
         error = "love",
         hint = "iris",
         info = "foam",
         note = "pine",
         todo = "rose",
         warn = "gold",

         -- Keep only essential git status colors
         git_add = "foam",
         git_change = "rose",
         git_delete = "love",
         git_dirty = "rose",
         git_ignore = "muted",
         git_merge = "iris",
      },

      -- Simplify header colors and reduce unnecessary groupings
      config = function(_, opts)
         require("rose-pine").setup(opts)
      end,
   }
}
