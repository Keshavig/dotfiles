return {
    "stevearc/conform.nvim",
    enabled = true,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "clang-format" },
            c = { "clang-format" },
            json = { "prettier" },
            jsonc = { "prettier" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            python = { "black" },
            rust = { "rustfmt" },
        },
        formatters = {
            stylua = { prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" } },
            clang_format = {
                prepend_args = { "--style={IndentWidth: 4}" },
            },
            shfmt = {
                prepend_args = { "-i", "4" },
            },
            prettier = {
                prepend_args = { "--tab-width", "4" },
            },
            black = {
                prepend_args = { "--line-length", "88", "--indent-width", "4" },
            },
        },
    },
}
