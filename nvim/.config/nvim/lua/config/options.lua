-- Disabling some inbuilt plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_remote_plugins = 1

-- Basic Qol settings
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
vim.o.completeopt = menuone, noinsert, noselect
vim.o.shell = "/usr/bin/zsh"
vim.cmd("highlight ColorColumn ctermbg=0 guibg=#282c34")
vim.cmd("set hlsearch")
vim.cmd("set termguicolors")
vim.cmd("set nu")
vim.cmd("set nofsync")
vim.cmd("set cinoptions=sN")
vim.cmd("set guicursor=")
