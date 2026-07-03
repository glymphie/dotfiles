local opt = vim.opt

-- Set mapping leader
vim.g.mapleader = " "

-- Configs and plugin dependencies
opt.filetype.plugin = "on"
opt.filetype.indent = "on"
opt.syntax = "on"
opt.number = true
opt.relativenumber = true
opt.incsearch = true
opt.showmode = false
opt.hlsearch = false
opt.updatetime = 50
opt.timeoutlen = 500

-- Cleaning
opt.directory = "/tmp/nvim/"
opt.viminfo:append("n~/.cache/viminfo")
vim.g.netrw_home = "~/.cache"

-- Nowrap for my sanities sake
opt.wrap = false

-- True colors
opt.termguicolors = true

-- Autocomplete
opt.wildmode = "longest,full"

-- Disable Auto-commenting
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Indent with 4 spaces
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

-- Shift to normal tab
vim.cmd([[autocmd Filetype makefile set expandtab!]])
vim.cmd([[autocmd Filetype c set expandtab!]])
vim.cmd([[autocmd Filetype cpp set expandtab!]])

-- Shift to 2 spaces
vim.cmd([[autocmd Filetype yaml set tabstop=2 shiftwidth=2]])
vim.cmd([[autocmd Filetype html set tabstop=2 shiftwidth=2]])
vim.cmd([[autocmd Filetype htmldjango set tabstop=2 shiftwidth=2]])
vim.cmd([[autocmd Filetype markdown set tabstop=2 shiftwidth=2]])

-- Persistent undo
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = "/tmp"

-- Trailing spaces and tabs
opt.list = true
opt.listchars = "trail:•,tab:»·"

-- Line Number Highlight
opt.cursorline = true
opt.cursorlineopt = "number"

-- Disable mouse
opt.mouse = ""

-- Split nicely
opt.splitbelow = true
opt.splitright = true

-- Default browser
vim.g.netrw_browsex_viewer = "brave-bin"

-- LSP settings
-- Keep left side column up with space for 1 notice
opt.signcolumn = "yes:1"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 8 space to top and bottom
vim.opt.scrolloff = 8
