-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.opt.iskeyword:append("-")
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true
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
vim.o.signcolumn = "yes"
vim.o.cmdheight = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.completeopt = menuone, noinsert, noselect
vim.o.statuscolumn = ""

vim.opt.colorcolumn = "100"

vim.cmd("highlight ColorColumn ctermbg=0 guibg=#282c34")
vim.cmd("set hlsearch")
vim.cmd("set termguicolors")
vim.cmd("set nu")
-- vim.cmd("set guicursor=")
vim.cmd("set nofsync")

vim.g.autoformat = false

vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#7aa2f7", bg = "NONE" })
