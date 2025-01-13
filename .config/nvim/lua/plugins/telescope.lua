return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", name = "fzf-native" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"BurntSushi/ripgrep",
			"fzf-native",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					-- file_ignore_patterns = {
					-- 	"node_modules",
					-- },
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},

					layout_strategy = "vertical",
				},
				extensions = {
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
					},
				},
			})

			telescope.load_extension("file_browser")
			telescope.load_extension("fzf")

			-- File explorer
			vim.keymap.set(
				"n",
				"<leader>fE",
				":Telescope file_browser<CR>",
				{ desc = "Open file explorer {File Explorer}" }
			)
			vim.keymap.set(
				"n",
				"<leader>fe",
				":Telescope file_browser path=%:p:h select_buffer=true<CR>",
				{ desc = "Open file explorer with current buffer path {File Explorer, with buffer path}" }
			)

			-- Fuzzy finders
			vim.keymap.set(
				"n",
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				{ desc = "Fuzzy find files in cwd {Find File}" }
			)
			vim.keymap.set(
				"n",
				"<leader>fg",
				"<cmd>Telescope live_grep<cr>",
				{ desc = "Search in cwd files {Files Grep}" }
			)
			vim.keymap.set({ "n", "v" }, "<leader>fG", "<cmd>Telescope grep_string<cr>", {
				desc = "Searches for the string under your cursor or selection in your current working directory, {Grep}",
			})
			vim.keymap.set(
				"n",
				"<leader>fb",
				"<cmd>Telescope buffers<cr>",
				{ desc = "Show open buffers {Find Buffer}" }
			)

			-- Git commands
			vim.keymap.set(
				"n",
				"<leader>fvs",
				"<cmd>Telescope git_status<cr>",
				{ desc = "Show git status {Vcs Status}" }
			)
			vim.keymap.set(
				"n",
				"<leader>fvc",
				"<cmd>Telescope git_commits<cr>",
				{ desc = "Show git commits {Vcs Commits}" }
			)
			vim.keymap.set(
				"n",
				"<leader>fvb",
				"<cmd>Telescope git_branches<cr>",
				{ desc = "Show git branches {Vcs Branches}" }
			)
			vim.keymap.set("n", "<leader>fvt", "<cmd>Telescope git_stash<cr>", { desc = "Show vcs stash {Vcs sTash}" })

			-- LSP commands
			vim.keymap.set(
				"n",
				"<leader>fs",
				"<cmd>Telescope lsp_document_symbols<cr>",
				{ desc = "Symbols in current buffer {Find Symbols}" }
			)
			vim.keymap.set(
				"n",
				"<leader>fS",
				"<cmd>Telescope lsp_workspace_symbols<cr>",
				{ desc = "Symbols in workspace {Find Symbols}" }
			)

			vim.keymap.set(
				"n",
				"<leader>fd",
				"<cmd>Telescope diagnostics<cr>",
				{ desc = "Show lsp diagnostics {Find Diagnostics}" }
			)
			vim.keymap.set(
				"n",
				"gr",
				"<cmd>Telescope lsp_references<cr>",
				{ desc = "Show lsp references {Go References}" }
			)
			vim.keymap.set(
				"n",
				"gi",
				"<cmd>Telescope lsp_implementations<cr>",
				{ desc = "Show lsp implementations {Go Implementations}" }
			)
			vim.keymap.set(
				"n",
				"gd",
				"<cmd>Telescope lsp_definitions<cr>",
				{ desc = "Show lsp definitions {Go Definitions}" }
			)
			vim.keymap.set(
				"n",
				"gy",
				"<cmd>Telescope lsp_type_definitions<cr>",
				{ desc = "Show lsp type definitions {Go tYpe definitions}" }
			)
		end,
	},
}
