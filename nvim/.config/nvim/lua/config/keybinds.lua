-- stylua: ignore
local project_dir = "~/projects"
vim.keymap.set("n", "<leader>pf", function()
    require("fzf-lua").files({
        cwd = vim.fn.expand(project_dir),
        fd_opts = "--type directory --max-depth 3"
    })
end, { silent = true, desc = "Search folder in ~/project directory" })

vim.keymap.set("n", "<leader>.", function()
    require("fzf-lua").files({
        cwd = vim.fn.expand("../../"),
        fd_opts = "--max-depth 3 --type f",
    })
end, { noremap = true, silent = true, desc = "Search files in current directory preview" })

vim.keymap.set("n", "<leader>nc", function()
    require("fzf-lua").files({
    cwd = vim.fn.stdpath("config"),
})
end, { noremap = true, silent = true, desc = "Search files in Neovim config directory" })

-- stylua: ignore end
vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "Find files in current directory (FZF)" })

local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end

vim.keymap.set("v", "J", "<CMD>m '>+1<CR>gv=gv", { desc = "In Visual Mode Transpose line down" })
vim.keymap.set("v", "K", "<CMD>m '>-2<CR>gv=gv", { desc = "In Visual Mode Transpose line up" })

vim.keymap.set("n", "<M-,>", "<C-w>5>")
vim.keymap.set("n", "<M-.>", "<C-w>5<")
vim.keymap.set("n", "<C-M-j>", "<C-w>-")
vim.keymap.set("n", "<C-M-k>", "<C-w>+")

-- Switch between splits
vim.keymap.set({"n", "t"}, "<leader>wj", "<C-w>j", { desc = "Navigate splits: Go down" })
vim.keymap.set({"n", "t"}, "<leader>wk", "<C-w>k", { desc = "Navigate splits: Go up" })
vim.keymap.set({"n", "t"}, "<leader>wl", "<C-w>l", { desc = "Navigate splits: Go right" })
vim.keymap.set({"n", "t"}, "<leader>wh", "<C-w>h", { desc = "Navigate splits: Go left" })
vim.keymap.set({"n", "t"}, "<leader>wc", "<C-w>c", { desc = "Close current window" })
-- vim.keymap.set("n", "<leader>wx", "<C-w>x",      { desc = "Close all window's except the current one" })
-- vim.keymap.set("n", "<leader>vs", "<CMD>vsplit<CR>", { desc = "Create a Vertical split" })
-- vim.keymap.set("n", "<leader>hs", "<CMD>split<CR>",  { desc = "Create a horizontal split" })

-- The name's primeagen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go up" })
vim.keymap.set("n", "n", "nzzzv",       { desc = "Go to next search result" })
vim.keymap.set("n", "N", "Nzzzv",       { desc = "Go to previous search result" })
-- vim.keymap.set("n", "<leader>mx", ":!chmod +x %<CR>", { desc = "Make current file Executabel" })

vim.keymap.set("n", "<space>to", function()
    vim.cmd("vnew")
    vim.cmd("term")
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)

    vim.api.nvim_feedkeys("A", "n", false)
end)

vim.keymap.set("t", "<ESC>", "<c-\\><c-n>")
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("n", "<C-c>", "<CMD>nohlsearch<CR>")
vim.keymap.set("i", "<C-k>", "<ESC>")
vim.keymap.set({"i", "n" }, "<C-BS>", "<CMD> norm db<CR>")

-- vim.keymap.set("n", "<leader>c",  "<CMD>Compile<CR>",                  { desc = "Emacs like compile mode" })
-- vim.keymap.set("n", "<leader>cn", "<CMD>NextError<CR>",                { desc = "Goto Next error in compilation" })
-- vim.keymap.set("n", "<leader>cp", "<CMD>PrevError<CR>",                { desc = "Goto Prev error in compilation" })
-- vim.keymap.set("n", "<leader>ti", "<CMD>TodoTrouble<CR>",              { desc = "Open all Todo's/Note's into trouble window" })
-- vim.keymap.set("n", "<leader>tu", "<CMD>TodoTelescope<CR>",            { desc = "Open all Todo's/Note's into trouble window" })
-- vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>",                       { desc = "Close buffer" })
vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>",      { desc = "Open netrw" })
vim.keymap.set("n", "<leader>fm", "<CMD>Format<CR>", { desc = "Format active buffer" })

vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<CR>", { desc = "Diagnostics (Trouble)" })
-- local cmd = function()
--     require("trouble").next({ jump = true, skip_groups = true})
-- end,
--
-- vim.keymap.set("n", "<leader>tn", cmd, { desc = "Jump Through " })
--vim.keymap.set("n", "<leader>tp", "<CMD>Trouble diagnostics prev<CR>", { desc = "Jump to next error in Trouble's diagnostics list" })

-- vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
-- vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
-- vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP Definitions / references / ... (Trouble)" })
-- vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
-- vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })
