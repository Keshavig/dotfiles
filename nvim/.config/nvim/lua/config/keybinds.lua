-- stylua: ignore start
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
        winopts = { width = 0.6, },
        cwd = vim.fn.stdpath("config"),
    })
end, { noremap = true, silent = true, desc = "Search files in Neovim config directory" })

-- stylua: ignore end
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find files in current directory (FZF)" })

local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function() go({ severity = severity }) end
end

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "In Visual Mode Transpose line down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "In Visual Mode Transpose line up" })

vim.keymap.set("n", "<M-,>",   "<C-w>5>")
vim.keymap.set("n", "<M-.>",   "<C-w>5<")
vim.keymap.set("n", "<C-M-j>", "<C-w>-")
vim.keymap.set("n", "<C-M-k>", "<C-w>+")

-- Switch between splits
vim.keymap.set("n", "<leader>wj", "<C-w>j",      { desc = "Navigate splits: Go down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k",      { desc = "Navigate splits: Go up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l",      { desc = "Navigate splits: Go right" })
vim.keymap.set("n", "<leader>wh", "<C-w>h",      { desc = "Navigate splits: Go left" })
vim.keymap.set("n", "<leader>wc", "<C-w>c",      { desc = "Close current window" })
vim.keymap.set("n", "<leader>wx", "<C-w>x",      { desc = "Close all window's except the current one" })
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Create a Vertical split" })
vim.keymap.set("n", "<leader>hs", ":split<CR>",  { desc = "Create a horizontal split" })

-- The name primeagen
vim.keymap.set("n", "<C-d>",      "<C-d>zz",          { desc = "Go down" })
vim.keymap.set("n", "<C-u>",      "<C-u>zz",          { desc = "Go up" })
vim.keymap.set("n", "n",          "nzzzv",            { desc = "Go to next search result" })
vim.keymap.set("n", "N",          "Nzzzv",            { desc = "Go to previous search result" })
vim.keymap.set("n", "<leader>mx", ":!chmod +x %<CR>", { desc = "Make current file Executabel" })

vim.keymap.set("n", "<space>to", function()
    vim.cmd("vnew")
    vim.cmd("term")
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)

    vim.api.nvim_feedkeys("A", "n", false)
end)

vim.keymap.set("t", "<ESC>", "<c-\\><c-n>")
vim.keymap.set("i", "<C-c>", "<ESC>")

vim.keymap.set("n", "<leader>c",  ":Compile<CR>",                  { desc = "Emacs like compile mode" })
vim.keymap.set("n", "<leader>cn", ":NextError<CR>",                { desc = "Goto Next error in compilation" })
vim.keymap.set("n", "<leader>cp", ":PrevError<CR>",                { desc = "Goto Prev error in compilation" })
vim.keymap.set("n", "<leader>ti", ":TodoTrouble<CR>",              { desc = "Open all Todo's/Note's into trouble window" })
vim.keymap.set("n", "<leader>tu", ":TodoTelescope<CR>",            { desc = "Open all Todo's/Note's into trouble window" })
vim.keymap.set("n", "<leader>tn", ":Trouble diagnostics next<CR>", { desc = "Jump to next error in  diagnostics list" })
vim.keymap.set("n", "<leader>tp", ":Trouble diagnostics prev<CR>", { desc = "Jump to next error in Trouble's diagnostics list" })
vim.keymap.set("n", "<leader>ne", ":Ex<CR>",                       { desc = "Open netrw" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>",                       { desc = "Close buffer" })
vim.keymap.set("n", "<leader>fm", ":Format<CR>",                   { desc = "Format buffer" })

vim.keymap.set("n", "]d", diagnostic_goto(true),  { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
-- vim.api.nvim_set_keymap('n', '<leader>fi', ':lua require("conform").format()<CR>', { noremap = true, silent = true, desc = 'Format current buffer'})
