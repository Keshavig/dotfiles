-- [[ KEYBINDS ]]

-- Fzf
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

vim.keymap.set("n", "<leader>.", ":FzfLua files<CR>", {noremap = true, silent = true, desc = "Find files in current directory (FZF)" })
vim.api.nvim_set_keymap('n', '<leader>fi', ':lua require("conform").format()<CR>', { noremap = true, silent = true, desc = 'Format current buffer'})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "In Visual Mode Transpose line down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { noremap = true, silent = true, desc = "In Visual Mode Transpose line up"  })

vim.keymap.set("n", "<M-,>", "<C-w>5<")
vim.keymap.set("n", "<M-.>", "<C-w>5>")
vim.keymap.set("n", "<C-M-j>", "<C-w>+")
vim.keymap.set("n", "<C-M-k>", "<C-w>-")

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

-- Got from primeagen stuff
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Go down by 20+ steps" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Go up by 20+ steps" })
vim.keymap.set("n", "n",     "nzzzv",   { noremap = true, silent = true, desc = "Go to next search result" })
vim.keymap.set("n", "N",     "Nzzzv",   { noremap = true, silent = true, desc = "Go to previous search result" })
vim.keymap.set("n", "<leader>mx", ":!chmod +x %<CR>", { noremap = true, silent = true, desc = "Make current file Executabel" } )

-- Executing lua code
vim.keymap.set("n", "<leader>sx", ":source %<CR>", { noremap = true, desc = "Source active file" })
vim.keymap.set("n", "<space>rl", ":.lua<CR>", { noremap = true, desc = "Execute the line currently in" } )
vim.keymap.set("v", "<space>rl", ":lua<CR>", { noremap = true, desc = "Execute the line currently in just in visual mode" })

vim.keymap.set("n", "<leader>ch", ":set cmdheight=0<CR>", { noremap = true, desc = "Set CmdHeight to be 0" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

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
vim.keymap.set('n', '<C-i>', ":normal! v$<CR>", { noremap = true, silent = true })

--[[ 
"grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
 "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
 "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
 "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
 "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
 CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
 ]]

