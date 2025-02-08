return {
  {
    "echasnovski/mini.hipatterns",
    opts = function(_, opts)
      local hi = require("mini.hipatterns")

      opts.highlighters = opts.highlighters or {}

      opts.highlighters = vim.tbl_extend("keep", opts.highlighters, {
        -- 🔹 Custom hex color highlighter with ⬤ inline
        hex_color = {
          pattern = "#%x%x%x%x%x%x", -- Matches #RRGGBB
          group = function(_, match)
            return hi.compute_hex_color_group(match, "fg")
          end,
          extmark_opts = function(_, _, data)
            return {
              virt_text = { { "  ", data.hl_group } }, -- Circle beside hex
              virt_text_pos = "inline", -- Show at end of line
              priority = 2000,
            }
          end,
        },
      })
    end,
  },
}
