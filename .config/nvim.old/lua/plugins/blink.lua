local utils = require("utils")

return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = {
			enabled = true,
			window = {
				border = utils.border,
			},
		},
		completion = {
			menu = {
				direction_priority = { "n", "s" },
				border = utils.border,
			},
			list = {
				cycle = {
					from_bottom = true,
				},
			},
			documentation = {
				auto_show = true,
				window = {
					border = utils.border,
				},
			},
		},
	},
}
