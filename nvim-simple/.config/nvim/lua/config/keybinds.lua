-- [[ KEYBINDS ]]

-- From lazynvim, am getting the depriciated warning but the new one does not work, so check * for update:
-- * = https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "<leader>fs", function()
    require("fzf-lua").files({
        previewer = false,
        winopts = {
            width = 0.6,
        },
        cwd = vim.fn.expand("~"),
        fd_opts = "--max-depth 5 --type f",
    })
end, { noremap = true, silent = true, desc = "Search files in home directory without preview" })

vim.keymap.set("n", "<leader>fj", function()
    require("fzf-lua").files({
        previewer = false,
        winopts = {
            width = 0.6,
        },
        cwd = vim.fn.expand("../../"),
        fd_opts = "--max-depth 3 --type f",
    })
end, { noremap = true, silent = true, desc = "Search files in current directory without preview" })

vim.keymap.set("n", "<leader>en", function()
    require("fzf-lua").files({
        previewer = false,
        winopts = { width = 0.6, },
        cwd = vim.fn.stdpath("config"),
    })
end, { noremap = true, silent = true, desc = "Search files in Neovim config directory" })

vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", {noremap = true, silent = true, desc = "Find files in current directory (FZF)" })
-- vim.api.nvim_set_keymap('n', '<leader>fi', ':lua require("conform").format()<CR>', { noremap = true, silent = true, desc = 'Format current buffer'})

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "In Visual Mode Transpose line down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { noremap = true, silent = true, desc = "In Visual Mode Transpose line up"  })

vim.keymap.set("n", "<M-,>", "<C-w>5<")
vim.keymap.set("n", "<M-.>", "<C-w>5>")
vim.keymap.set("n", "<C-M-j>", "<C-w>+")
vim.keymap.set("n", "<C-M-k>", "<C-w>-")

-- Switch between splits
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true, desc = "Navigate splits: Go down" }) -- Down
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true, desc = "Navigate splits: Go up" }) -- Up
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true, desc = "Navigate splits: Go right" }) -- Right
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true, desc = "Navigate splits: Go left" }) -- Left
vim.keymap.set("n", "<leader>wc", "<C-w>c", { noremap = true, silent = true, desc = "Close current window" }) -- Close
vim.keymap.set("n", "<leader>wx", "<C-w>x", { noremap = true, silent = true, desc = "Close all window's except the current one" }) -- Close all except current
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { noremap = true, silent = true, desc = "Create a Vertical split" }) -- Vertical split
vim.keymap.set("n", "<leader>hs", ":split<CR>", { noremap = true, silent = true, desc = "Create a horizontal split" }) -- horizontal split

-- The name primeagen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Go down by 20+ steps" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Go up by 20+ steps" })
vim.keymap.set("n", "n",     "nzzzv",   { noremap = true, silent = true, desc = "Go to next search result" })
vim.keymap.set("n", "N",     "Nzzzv",   { noremap = true, silent = true, desc = "Go to previous search result" })
vim.keymap.set("n", "<leader>mx", ":!chmod +x %<CR>", { noremap = true, silent = true, desc = "Make current file Executabel" } )

vim.keymap.set("n", "<space>to", function()
    vim.cmd("vnew")   -- Open a new vertical split
    vim.cmd("term")   -- Start terminal
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15) -- Set height

    vim.api.nvim_feedkeys("A", "n", false)
end)

vim.keymap.set("t", "<ESC>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>ef", "<CMD>Floaterminal<CR>", { noremap = true, silent = true, desc = "Open a floating terminal" })
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Control+C = Escape Key in Insert Mode" })
vim.keymap.set('n', '<leader>c', "<CMD>Compile<CR>",      { noremap = true, desc = "Emacs like compile mode" })
vim.keymap.set('n', '<leader>cn', "<CMD>NextError<CR>",   { noremap = true, silent = true, desc = "Emacs like compile mode" })
vim.keymap.set('n', '<leader>cp', "<CMD>PrevError<CR>",   { noremap = true, silent = true, desc = "Emacs like compile mode" })
vim.keymap.set('n', '<leader>ti', '<CMD>TodoTrouble<CR>', { noremap = true, silent = true, desc = "Open all Todo's/Note's into trouble window"})
vim.keymap.set('n', '<leader>tu', '<CMD>TodoTelescope<CR>', { noremap = true, silent = true, desc = "Open all Todo's/Note's into trouble window"})
vim.keymap.set('n', '<leader>tn', '<CMD>Trouble diagnostics next<CR>', { noremap = true, silent = true, desc = "Jump to next error in Trouble's diagnostics list"} )
vim.keymap.set('n', '<leader>tp', '<CMD>Trouble diagnostics prev<CR>', { noremap = true, silent = true, desc = "Jump to next error in Trouble's diagnostics list"} )
vim.keymap.set('n', '<leader>ne', '<CMD>Ex<CR>', { desc = "Open netrw" })
vim.keymap.set('n', '<leader>bd', '<CMD>bd<CR>', { desc = "Close buffer" })

vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
