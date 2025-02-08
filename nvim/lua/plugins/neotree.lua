return {
    'nvim-neo-tree/neo-tree.nvim',
    -- cmd = 'Neotree',
    event = "VeryLazy",
    init = function()
        vim.api.nvim_create_autocmd('BufEnter', {
            -- make a group to be able to delete it later
            group = vim.api.nvim_create_augroup('NeoTreeInit', {clear = true}),
            callback = function()
                local f = vim.fn.expand('%:p')
                if vim.fn.isdirectory(f) ~= 0 then
                    vim.cmd('Neotree current dir=' .. f)
                    -- neo-tree is loaded now, delete the init autocmd
                    vim.api.nvim_clear_autocmds{group = 'NeoTreeInit'}
                end
            end
        })
        -- keymaps
    end,
    opts = {
        filesystem = {
            hijack_netrw_behavior = 'open_current'
        }
    },

    config = function()
        vim.keymap.set("n", "<leader>dj", ":Neotree position=current<CR>", { silent = true, noremap = true, desc = "Open Neotree"})
        vim.keymap.set("n", "<leader>pf", ":Neotree position=bottom<CR>", { silent = true, noremap = true})
    end,
}
