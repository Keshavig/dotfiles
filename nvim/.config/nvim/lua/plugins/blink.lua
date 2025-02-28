return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = {
            preset = "super-tab",
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
        completion = {
            ghost_text = { enabled = false },
            documentation = { treesitter_highlighting = true },
            menu = {
                --border = "rounded",
                scrollbar = false,
                direction_priority = { "s", "n" },
                winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:Visual,Search:None",
                draw = {
                    treesitter = { "lsp" },
                    columns = { { "kind_icon" }, { "label" } },
                    -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                    -- columns = { { "kind_icon", "kind" }, { "label", "label_description" } },
                },
            },
        },

    },
}
