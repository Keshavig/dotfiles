return {
    "saghen/blink.cmp",
    enabled = true,
    event = "InsertEnter",
    -- dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        signature = { enabled = true },
        keymap = { preset = "super-tab" },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "cmdline", "omni" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
        cmdline = {
            keymap = { ["<Tab>"] = { "show", "accept" } },
            completion = { menu = { auto_show = false } }, -- My laptop is way too slow for this :(
        },
        completion = {
            ghost_text = { enabled = false },
            documentation = { treesitter_highlighting = true },
            menu = {
                auto_show = true,
                border = "single",
                scrollbar = false,
                winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:Visual,Search:None",
                draw = {
                    treesitter = { "lsp" },
                    -- columns = { { "kind_icon" }, { "label" } },
                    -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                    columns = { { "kind_icon" }, { "kind" }, { "label", "label_description" } },
                },
            },
        },
    },
}
