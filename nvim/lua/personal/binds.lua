vim.keymap.set("n", "<leader>fs", function()
   require("fzf-lua").files({
      previewer = false, -- Disable the preview window
      winopts = {
         width = 0.6, -- Set the width to 60% of the screen
      },
      cwd = vim.fn.expand("~"), -- Set the current working directory to home
      fd_opts = "--max-depth 6 --type f", -- Limit recursion depth and include only files
   })
end, { noremap = true, silent = true, desc = "Search files in home directory without preview" })

vim.keymap.set("n", "<leader>.", function()
   require("fzf-lua").files({
      previewer = false, -- Disable the preview window
      winopts = {
         width = 0.6, -- Set the width to 60% of the screen
      },
      cwd = vim.fn.expand("../../"),
      fd_opts = "--max-depth 6 --type f", -- Limit recursion depth and include only files
   })
end, { noremap = true, silent = true, desc = "Search files in home directory without preview" })

vim.api.nvim_set_keymap('n', '<leader>fi', ':lua require("conform").format()<CR>', { noremap = true, silent = true, desc = 'Format current buffer'})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.api.nvim_set_keymap("n", "<leader>j", "%", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tj", ":tabclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>km', '<cmd>lua require("fzf-lua").keymaps()<cr>', { noremap = true, silent = true })

-- Switch between splits
vim.keymap.set("n", "<Space>wj", "<C-w>j", { noremap = true, silent = true }) -- Down
vim.keymap.set("n", "<Space>wk", "<C-w>k", { noremap = true, silent = true }) -- Up
vim.keymap.set("n", "<Space>wl", "<C-w>l", { noremap = true, silent = true }) -- Right
vim.keymap.set("n", "<Space>wh", "<C-w>h", { noremap = true, silent = true }) -- Left
vim.keymap.set("n", "<Space>wc", "<C-w>c", { noremap = true, silent = true }) -- Close
vim.keymap.set("n", "<Space>wx", "<C-w>x", { noremap = true, silent = true }) -- Close all except current
vim.keymap.set("n", "<Space>vs", ":vsplit<CR>", { noremap = true, silent = true }) -- Vertical split
vim.keymap.set("n", "<Space>hs", ":split<CR>", { noremap = true, silent = true }) -- horizontal split

