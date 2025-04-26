-- Disabling some built in n/vim plugins
for _, plugin in ipairs({
    "gzip",
    "tar",
    "tarPlugin",
    "zip",
    "zipPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logiPat",
    "rrhelper",
    "remote_plugins",
}) do
    vim.g["loaded_" .. plugin] = 1
end

-- Basic Qol settings
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.o.ignorecase = true
vim.opt.iskeyword:append("-")
-- if this is false then, the numeber for current line in the statuscolumn always shows 0 
vim.o.number = true

vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.opt.backspace = "indent,eol,start"
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wrap = false
vim.o.textwidth = 300
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.list = true
vim.o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.signcolumn = 'yes'

-- NEOVIDE
if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_cursor_hack = true
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_command_line = false
    -- vim.g.neovide_scroll_animation_length = 0
    vim.keymap.set({"n", "i", "v", "t", "c"}, "<C-=>", "<CMD>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR><CMD>redraw<CR>", { silent = true })
    vim.keymap.set({"n", "i", "v", "t", "c"}, "<C-->", "<CMD>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR><CMD>redraw<CR>", { silent = true })
    vim.keymap.set({"n", "i", "v", "t", "c"}, "<C-+>", "<CMD>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR><CMD>redraw<CR>", { silent = true })
    vim.keymap.set({"n", "i", "v", "t", "c"}, "<C-_>", "<CMD>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR><CMD>redraw<CR>", { silent = true })
    vim.keymap.set({"n", "i", "v", "t", "c"}, "<C-0>", "<CMD>lua vim.g.neovide_scale_factor = 1<CR><CMD>redraw<CR>", { silent = true })
    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 5
    vim.g.neovide_padding_left = 0
end

vim.o.cmdheight = 1
vim.o.completeopt = menuone, noinsert, noselect
vim.cmd("set hlsearch")
vim.cmd("set nofsync")
vim.cmd("set cinoptions=N-sg0")
vim.cmd("set guicursor=")
