return {
	{
		"folke/lazydev.nvim", -- Provides a dev environment for neovim plugins (types, autocompletion, ...)
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
			integrations = {
				cmp = false,
			},
		},
	},
}
