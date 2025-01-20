return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V",
					},
				},
				ensure_installed = {
					"vim",
					"lua",
					"bash",
					"yaml",
					"markdown",
					"markdown_inline",
					"json",
					"javascript",
					"typescript",
					"tsx",
					"scss",
					"css",
					"html",
					"graphql",
					"gitignore",
					"dockerfile",
					"nix",
				},
				textobjects = {
					move = {
						enable = true,
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
							-- ["]o"] = "@loop.*",
							-- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							-- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
							-- ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold end" },
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
							-- ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold start" },
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
							-- ["[Z"] = { query = "@fold", query_group = "folds", desc = "Previous fold end" },
						},
					},
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
					},
				},
			})

			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			vim.keymap.set(
				{ "n", "x", "o" },
				";",
				ts_repeat_move.repeat_last_move_next,
				{ desc = "Repeat last forward direction move" }
			)
			vim.keymap.set(
				{ "n", "x", "o" },
				",",
				ts_repeat_move.repeat_last_move_previous,
				{ desc = "Repeat last backward direction move" }
			)

			-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

			-- TODO: Make repeatable actions for other plugins
			-- example: make gitsigns.nvim movement repeatable with ; and , keys.
			-- local gs = require("gitsigns")
			--
			-- -- make sure forward function comes first
			-- local next_hunk_repeat, prev_hunk_repeat =
			-- 	ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
			-- -- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.
			--
			-- vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
			-- vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
}
