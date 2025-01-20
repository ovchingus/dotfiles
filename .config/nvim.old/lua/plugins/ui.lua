local utils = require("utils")
local map = utils.map

return {
	{
		"lukas-reineke/indent-blankline.nvim", -- Shows and Highlights indentation of code blocks
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
			},
			scope = {
				show_start = false,
				show_end = false,
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua", -- Highlights colors in code (hex, css, ...)
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	{
		"Chaitanyabsprip/fastaction.nvim", -- Adds code actions popup window
		---@type function|FastActionConfig
		config = function()
			require("fastaction").setup({
				popup = {
					border = utils.border,
				},
			})
			map({ "n", "x" }, "g.", '<cmd>lua require("fastaction").code_action()<CR>', "Run code action")
		end,
	},
}
