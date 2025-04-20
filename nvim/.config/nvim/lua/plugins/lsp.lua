return {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- Initialize Mason and Mason LSP Config
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "bashls",
                "clangd",
            },
        })

        local lspconfig = require("lspconfig")
        local blink_cmp = require("blink.cmp")

        local DEBOUNCE_TIME = 125

        vim.diagnostic.config({
            update_in_insert = true,
            --virtual_text = { spacing = 4, prefix = "●"},
            -- virtual_lines = { spacing = 4 },
            virtual_text = { spacing = 4 },
            float = { border = "rounded" },
            signs = true,
            underline = true,
            severity_sort = true,
        })

        local capabilities = blink_cmp.get_lsp_capabilities() -- Blink.cmp capabilities
        local on_attach = function(_, _)
        end -- Keybindings handled externally

        -- Define common server configurations
        local default_config = {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = { debounce_text_changes = DEBOUNCE_TIME },
        }

        -- Custom settings for specific servers
        local server_settings = {
            lua_ls = {
                on_init = function(client)
                    local workspace = client.workspace_folders and client.workspace_folders[1].name or nil
                    if
                        workspace
                        and not (vim.loop.fs_stat(workspace .. "/.luarc.json") or vim.loop.fs_stat(workspace .. "/.luarc.jsonc"))
                    then
                        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                        })
                    end
                end,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        format = { enable = true },
                    },
                },
            },
            clangd = {
                cmd = { "clangd", "--clang-tidy", "--enable-config" },
            },
            rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        procMacro = { enable = true },
                    },
                },
            },
            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            black = { enabled = true },
                            flake8 = { enabled = true },
                        },
                    },
                },
            },
        }

        -- Setup servers
        for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
            local config = vim.tbl_deep_extend("force", default_config, server_settings[server] or {})
            lspconfig[server].setup(config)
        end
    end,
}
