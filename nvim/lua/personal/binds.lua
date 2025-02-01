vim.keymap.set("n", "<leader>fs", function()
   require("fzf-lua").files({
      previewer = false, -- Disable the preview window
      winopts = {
         width = 0.6, -- Set the width to 60% of the screen
      },
      cwd = vim.fn.expand("~"), -- Set the current working directory to home
      fd_opts = "--max-depth 2 --type f", -- Limit recursion depth and include only files
   })
end, { noremap = true, silent = true, desc = "Search files in home directory without preview" })

vim.keymap.set("n", "<leader>fj", function()
   require("fzf-lua").files({
      previewer = false, -- Disable the preview window
      winopts = {
         width = 0.6, -- Set the width to 60% of the screen
      },
      cwd = vim.fn.expand("../../"),
      fd_opts = "--max-depth 3 --type f", -- Limit recursion depth and include only files
   })
end, { noremap = true, silent = true, desc = "Search files in current directory without preview" })

vim.api.nvim_set_keymap('n', '<leader>fi', ':lua require("conform").format()<CR>', { noremap = true, silent = true, desc = 'Format current buffer'})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "In Visual Mode Transpose line down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { noremap = true, silent = true, desc = "In Visual Mode Transpose line up"  })

vim.keymap.set("n", "<leader>tj", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true, desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true, desc = "Go to next tab" })
vim.keymap.set('n', '<leader>km', '<cmd>lua require("fzf-lua").keymaps()<cr>', { noremap = true, silent = true, desc = "Search through keymaps" })

-- Switch between splits
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true, desc = "Navigate splits: Go down" }) -- Down
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true, desc = "Navigate splits: Go up" }) -- Up
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true, desc = "Navigate splits: Go right" }) -- Right
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true, desc = "Navigate splits: Go left" }) -- Left
vim.keymap.set("n", "<leader>wc", "<C-w>c", { noremap = true, silent = true, desc = "Close current window" }) -- Close
vim.keymap.set("n", "<leader>wx", "<C-w>x", { noremap = true, silent = true, desc = "Close all window's except the current one" }) -- Close all except current
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { noremap = true, silent = true, desc = "Create a Vertical split" }) -- Vertical split
vim.keymap.set("n", "<leader>hs", ":split<CR>", { noremap = true, silent = true, desc = "Create a horizontal split" }) -- horizontal split

vim.keymap.set("n", "<leader>.", ":FzfLua files<CR>", {noremap = true, silent = true, desc = "Find files in current directory (FZF)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Go down by 20+ steps" })
vim.keymap.set("n", "<C-a>", "<C-u>zz", { noremap = true, silent = true, desc = "Go up by 20+ steps" })
vim.keymap.set("n", "n",     "nzzzv",   { noremap = true, silent = true, desc = "Go to next search result" })
vim.keymap.set("n", "N",     "Nzzzv",   { noremap = true, silent = true, desc = "Go to previous search result" })
vim.keymap.set("n", "<leader>mx", ":!chmod +x %<CR>", { noremap = true, silent = true, desc = "Make current file Executabel" } )

--[[ 
"grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
 "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
 "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
 "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
 "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
 CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
 ]]
