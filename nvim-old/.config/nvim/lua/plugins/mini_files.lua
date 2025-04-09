return {
    "echasnovski/mini.files",
    event = "VeryLazy",
    opts = {
        use_as_default_explorer = false,  -- I use Neotree for that
    },
    config = function()
       -- require("mini.files").setup()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesWindowUpdate',
            callback = function(args)
                local config = vim.api.nvim_win_get_config(args.data.win_id)

                config.height = 32
                if config.title[#config.title][1] ~= ' ' then
                    table.insert(config.title, { ' ', 'NormalFloat' })
                end
                if config.title[1][1] ~= ' ' then
                    table.insert(config.title, 1, { ' ', 'NormalFloat' })
                end

                vim.api.nvim_win_set_config(args.data.win_id, config)
            end,
        })
    end,

    keys = { { "<leader>ek", function() require("mini.files").open() end, desc = "Open Mini Files" } }
}
