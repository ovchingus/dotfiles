return {
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			keymaps = {
	-- 				accept_suggestion = "<Tab>",
	-- 				clear_suggestion = "<C-]>",
	-- 				accept_word = "<C-j>",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"Exafunction/codeium.nvim",
		event = "BufEnter",
		config = function()
			require("codeium").setup({
				enable_cmp_source = false,
				virtual_text = {
					enabled = true,
				},
			})
		end,
	},
}
