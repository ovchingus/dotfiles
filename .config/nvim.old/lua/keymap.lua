local utils = require("utils")
local map = utils.map

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shortcuts
map("n", "<leader>w", "<CMD>update<CR>", "Quick save")
map("n", "<leader>q", "<CMD>q<CR>", "Quick quit")
-- map("i", "jk", "<ESC>", "Exit insert mode")

-- Windows
-- map("n", "<leader>o", "<CMD>vsplit<CR>", "New vertical split window")
-- map("n", "<leader>p", "<CMD>split<CR>", "New horizontal split window")
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-l>", "<C-w>l", "Move to right window")
map("n", "<C-k>", "<C-w>k", "Move to upper window")
map("n", "<C-j>", "<C-w>j", "Move to lower window")
map("n", "<a-h>", "<C-w><", "Expand window left")
map("n", "<a-l>", "<C-w>>", "Expand window right")
map("n", "<a-k>", "<C-w>+", "Expand window top")
map("n", "<a-j>", "<C-w>-", "Expand window bottom")

-- Terminal
map("n", "<C-t>", '<CMD>exe v:count1 . "ToggleTerm"<CR>', "Toggle terminal")
map("v", "<C-t>", '<Esc><CMD>exe v:count1 . "ToggleTerm"<CR>', "Toggle terminal")
map("v", "<leader>st", function()
	require("toggleterm").send_lines_to_terminal("visual_selection", true, { args = vim.v.count })
end, "Send visual selection to terminal")
-- map("t", "<esc>", [[<C-\><C-n>]], "Exit terminal")
map("t", "jk", [[<C-\><C-n>]], "Exit terminal")
map("t", "<a-h>", [[<Cmd>wincmd h<CR>]], "")
map("t", "<a-j>", [[<Cmd>wincmd j<CR>]], "")
map("t", "<a-k>", [[<Cmd>wincmd k<CR>]], "")
map("t", "<a-l>", [[<Cmd>wincmd l<CR>]], "")

-- LSP actions
map("n", "gd", vim.lsp.buf.definition, "Go to definition")
map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
map("n", "gr", vim.lsp.buf.references, "Go to references")
-- map({ "n", "v" }, "g.", vim.lsp.buf.code_action, "Run code action")
map("n", "<leader>cd", vim.lsp.buf.rename, "Run LSP rename action")
map("n", "gh", vim.lsp.buf.hover, "Show LSP hover")

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics in popup")
map("n", "<leader>dd", vim.diagnostic.setqflist, "Open diagnostics list")
map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")

-- Source: https://github.com/mawkler/nvim/blob/51cd979771c58a6c0b4b6a8ae4787714c619b05f/lua/configs/keymaps.lua#L165
map("n", "<Esc>", function()
	if vim.v.hlsearch == 1 then
		vim.cmd.nohlsearch()
	elseif vim.bo.modifiable then
		utils.clear_lsp_references()
	elseif #vim.api.nvim_list_wins() > 1 then
		return utils.feedkeys("<C-w>c")
	end

	vim.cmd.fclose({ bang = true })
end, "Close window if not modifiable, otherwise clear LSP references")

map("n", "<leader>fa", "<CMD>Neotree filesystem reveal left<CR>", "Open Neotree filesystem")
map("n", "<leader>fx", "<CMD>Neotree git_status reveal left<CR>", "Open Neotree filesystem")
map("n", "<leader>fz", "<CMD>Neotree buffers reveal left<CR>", "Open Neotree filesystem")
