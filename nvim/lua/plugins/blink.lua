return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    -- event = "InsertEnter", -- Lazy load when entering insert mode
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
                border = "none",
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
