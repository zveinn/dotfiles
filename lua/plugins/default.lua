vim.g.mapleader = " "
vim.g.maplocalleader = ' '

vim.opt.encoding = "utf-8"

vim.opt.compatible = false
vim.opt.hlsearch = true

vim.opt.foldenable = false
vim.opt.relativenumber = false
vim.opt.number = false
vim.opt.laststatus = 3
vim.opt.vb = true
vim.opt.ruler = true
vim.opt.spelllang = "en_us"
vim.opt.autoindent = true
-- vim.opt.colorcolumn="120"
vim.opt.colorcolumn = ""
vim.opt.textwidth = 120
vim.opt.mouse = "a"
-- vim.opt.clipboard="unnamed"
vim.opt.scrollbind = false
vim.opt.wildmenu = true

vim.opt.swapfile = false
vim.opt.background = "dark"
-- vim.wo.number = false
vim.opt.splitright = true
vim.opt.ttimeoutlen = 50
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.softtabstop = 2
-- vim.opt.signcolumn = "yes:1"
vim.opt.signcolumn = "no"
vim.opt.hlsearch = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.g.go_fmt_autosave = 0
vim.g.go_doc_keywordprg_enabled = 0
-- vim.g.syntastic_auto_jump = 0

vim.cmd.fileformat = "unix"
-- vim.cmd.autocmd = "BufNewFile * set fileformat=unix"
vim.g.neovide_cursor_trail_legnth = 0
vim.g.neovide_cursor_animation_length = 0
vim.opt.cursorline = true
-- vim.o.guifont = "Hurmit Nerd Font Mono"
vim.opt.shell = '/bin/bash -i'
vim.o.guifont = "Berkeley Mono"

vim.diagnostic.config({
	virtual_lines = { 
		wrap = true, 
		highlight_whole_line = false
	},
	virtual_text = false,
  -- virtual_text = {
  --   wrap = true,
  --   spacing = 4,
  -- },
})

