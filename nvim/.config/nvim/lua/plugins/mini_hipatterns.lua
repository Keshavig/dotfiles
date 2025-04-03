return {
    {
        "echasnovski/mini.hipatterns",
        opts = function(_, opts)
            local hi = require("mini.hipatterns")

            opts.highlighters = opts.highlighters or {}

            opts.highlighters = vim.tbl_extend("keep", opts.highlighters, {
                hex_color = {
                    pattern = "#%x%x%x%x%x%x",
                    group = function(_, match)
                        return hi.compute_hex_color_group(match, "fg")
                    end,
                    extmark_opts = function(_, _, data)
                        return {
                            virt_text = { { "  ", data.hl_group } },
                            virt_text_pos = "inline",
                            priority = 2000,
                        }
                    end,
                },
            })
        end,
    },
}
