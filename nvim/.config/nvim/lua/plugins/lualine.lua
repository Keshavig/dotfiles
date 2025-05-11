return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = false,

    config = function()
        local lualine = require("lualine")

        -- Copied From Folke:lazyvim: https://www.lazyvim.org/plugins/ui
        -- local trouble = require("trouble")
        -- local symbols = trouble.statusline({
        --     mode = "symbols",
        --     groups = {},
        --     title = false,
        --     filter = { range = true },
        --     format = "{kind_icon}{symbol.name}",
        --
        --     hl_group = "lualine_c_normal",
        -- })

        local colors = {
            bg = "#282c34",
            fg = "#c0caf5",
            yellow = "#e0af68",
            cyan = "#7dcfff",
            darkblue = "#2ac3de",
            green = "#9ece6a",
            orange = "#ff9e64",
            violet = "#9d7cd8",
            magenta = "#bb9af7",
            blue = "#7aa2f7",
            red = "#f7768e", }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        local config = {
            options = {
                component_separators = "",
                section_separators = "",
                theme = {
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left({
            function()
                return "▊"
            end,
            color = { fg = colors.blue }, -- Sets highlighting of component
            padding = { left = 0, right = 1 }, -- We don't need space before this
        })

        ins_left({
            -- mode component
            function()
                local evil_doom_icon = ""
                local lua_icon = "󰢱"
                local arch_linux_icon = "󰣇"

                return evil_doom_icon
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    -- n = colors.green,
                    n = colors.red,
                    i = colors.blue,
                    v = colors.magenta,
                    [""] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [""] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ["r?"] = colors.cyan,
                    ["!"] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        })

        ins_left({
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.orange, gui = "bold" },
        })

        ins_left({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
            },
        })

        -- ins_left({
        --     symbols and symbols.get,
        --     color = { bg = colors.bg, fg = colors.fg },
        --     cond = function()
        --         return vim.b.trouble_lualine ~= false and symbols.has()
        --     end,
        -- })

        ins_left({
            function()
                return "%="
            end,
        })

        ins_right({ "location", color = { fg = colors.fg, gui = "bold" } })

        ins_right({
            "branch",
            icon = "",
            color = { fg = colors.violet, gui = "bold" },
        })

        ins_right({
            "diff",
            symbols = { added = " ", modified = "󰝤 ", removed = " " },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        })

        ins_right({
            function()
                return "▊"
            end,
            color = { fg = colors.blue },
            padding = { left = 0 },
        })

        lualine.setup(config)
    end,
}
