return {
	{
		"nvim-neo-tree/neo-tree.nvim", -- Provides a nice file tree on left of editor
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"antosha417/nvim-lsp-file-operations", -- Uses lsp to auto update imports on file name change and etc...
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
