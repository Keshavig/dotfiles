-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell") CORE STUFF --
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
-- vim.opt.iskeyword:append("-")
-- vim.o.lazyredraw = true -- Does not work with noice.nvim
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
vim.o.autoindent = true
vim.o.wrap = true
vim.o.textwidth = 300
vim.o.tabstop = 4
vim.o.shiftwidth = 3
vim.o.softtabstop = -1
vim.o.list = true
vim.o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.cursorline = false
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.cmdheight = 0
vim.o.completeopt = menuone, noinsert, noselect
vim.cmd("set nohlsearch")
vim.cmd("set termguicolors")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("set nu")
vim.cmd("highlight Normal guibg=none")
-- vim.cmd("set guicursor=")
vim.api.nvim_create_autocmd("TextYankPost", {
  group = num_au,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
  end,
})

-- If you want to disable autoformat for ALL file types by default, you can do something like:
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.b.autoformat = false -- Disable autoformat globally for all buffers
  end,
})
