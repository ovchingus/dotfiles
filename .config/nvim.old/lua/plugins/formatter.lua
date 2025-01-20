return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>s",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			-- currently formates as source.fixAll by lsp
			-- javascript = { "prettier" },
			-- typescript = { "prettier" },
			-- javascriptreact = { "prettier" },
			-- typescriptreact = { "prettier" },
			lua = { "stylua" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			-- TODO: Add nixfmt with mason https://github.com/NixOS/nixfmt
			-- nix = { "nixfmt" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 1000,
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
