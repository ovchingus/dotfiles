local utils = require("utils")

return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-tool-installer").setup({
				integrations = {
					["mason-lspconfig"] = true,
				},
				ensure_installed = {
					-- mason
					"prettier",
					"stylua",
					-- mason-lspconfig
					"vtsls",
					"lua_ls",
					"cssls",
					"eslint",
					"html",
					"jsonls",
					"tailwindcss",
					"graphql",
					"nil_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local nvim_lsp = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Add the border on hover and on signature help popup window
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = utils.border }),
				["textDocument/signatureHelp"] = vim.lsp.with(
					vim.lsp.handlers.signature_help,
					{ border = utils.border }
				),
			}

			for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
				nvim_lsp[server].setup({
					capabilities = capabilities,
					handlers = handlers,
				})
			end

			local function organize_imports()
				local params = {
					command = "typescript.removeUnusedImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end

			nvim_lsp["vtsls"].setup({
				capabilities = capabilities,
				handlers = handlers,
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})
		end,
	},
}
