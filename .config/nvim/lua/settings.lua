local utils = require("utils")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
-- vim.opt.syntax = "on"
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.encoding = "UTF-8"
vim.opt.ruler = true
vim.opt.showmode = false
vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.ttimeoutlen = 0
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.path:append(".,**")
vim.opt.autoread = true
-- vim.opt.hidden = true
-- vim.opt.inccommand = "split"
-- vim.opt.showcmd = true

vim.diagnostic.config({
	-- virtual_text = false,
	float = {
		border = utils.border,
	},
})
